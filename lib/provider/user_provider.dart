import 'package:flutter/cupertino.dart';
import 'package:upes_go/Firebase/firebase_constants.dart';
import 'package:upes_go/models/user_model.dart';

class UserDataProvider with ChangeNotifier {
  UserModel userModel = UserModel(
      userid: "doc1",
      name: "Arin Agrawal",
      phone: "0987656789",
      email: "arinagrawal@gmail.com",
      dept: "CSE",
      // String pro = "arinagrawal@gmail.com";
      photoUrl:
          "https://play-lh.googleusercontent.com/C9CAt9tZr8SSi4zKCxhQc9v4I6AOTqRmnLchsu1wVDQL0gsQ3fmbCVgQmOVM1zPru8UH=w240-h480-rw",
      fcmToken: FirebaseConsts.MYDEVICE_FCM,
      registration: "R21342343",
      sapID: "500120660",
      year: "1St",
      enrolledList: [],
      points: 400);

  bool isHosteller = true;
  bool additionalInfoGiven = true;
  String block = "B";
  String room = "101";
  String parentsPhone = "500120660";

  String registrationNo = "R21342343";

  void feedUserModel(UserModel model) {
    userModel = model;
    notifyListeners();
  }

  // void setUserData(String Guserid, String Gname, String Gemail, String Gphone,
  //     String Gphoto) {
  //   userid = Guserid;
  //   name = Gname;
  //   email = Gemail;
  //   phone = Gphone;
  //   photo = Gphoto;
  //   notifyListeners();
  // }
}
