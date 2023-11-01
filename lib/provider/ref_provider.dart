import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../Enums/state.dart';
// import 'package:referral_app/enums/state.dart';

class RefProvider extends ChangeNotifier {
  ViewState state = ViewState.Idle;

  String message = "";

  CollectionReference profileRef =
      FirebaseFirestore.instance.collection("Users");
  CollectionReference rewardRef =
      FirebaseFirestore.instance.collection("Rewards");

  FirebaseAuth auth = FirebaseAuth.instance;

  setReferral(String refCode, String refferedUserid) async {
    state = ViewState.Busy;
    notifyListeners();

    try {
      final value = await profileRef.where("refCode", isEqualTo: refCode).get();
      if (value.docs.isEmpty) {
        ///ref code is not available
        message = 'Refcode is not available';
        state = ViewState.Error;
        notifyListeners();
      } else {
        print(refCode + " yyy");

        /// It exists
        final data = value.docs[0];

        ///Get referrals
        List referrals = data.get("referals_list") ?? [];

        referrals.add(refferedUserid);
        print(data.id.toString());

        ///Update the ref earning
        final body = {
          "referals_list": referrals,
          "points": data.get("points") + 500
        };
        print("object");

        var id = Uuid().v4();
        rewardRef.doc(id).set({
          "reward_id": id,
          "reward_type": "refferal_by",
          "userid": refferedUserid,
          "points": 1200,
          "timestamp": Timestamp.now()
        });
        var id2 = Uuid().v4();

        rewardRef.doc(id2).set({
          "reward_id": id2,
          "reward_type": "refferal_to",
          "userid": data.id,
          "points": 500,
          "timestamp": Timestamp.now()
        });
        profileRef.doc(data.id).update(body);
        profileRef.doc(refferedUserid).update({"points": 1200});
        message = "Ref success";
        state = ViewState.Success;
        notifyListeners();
      }
    } on FirebaseException catch (e) {
      message = e.message.toString();
      state = ViewState.Error;
      notifyListeners();
    }
  }
}
