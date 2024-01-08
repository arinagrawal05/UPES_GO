import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../getx/resell_search_controller.dart';
import '../Hive_models/commission_models/lost_hive_model.dart';
import '../Hive_models/commission_models/resell_hive_model.dart';
// import '/shared/exports.dart';

class LostHiveHelper {
  static const String _lostProductsBoxName = 'lostBox';
  // static const String _fDcommissionBoxName = 'fdCommissionBox';
  // static const String _lifecommissionBoxName = 'lifeCommissionBox';
  // static const String _motorcommissionBoxName = 'motorCommissionBox';

  static late Box<LostHiveModel> lostProductsBoxName;
  // static late Box<CommissionHiveModel> fDCommissionBox;
  // static late Box<CommissionHiveModel> lifeCommissionBox;
  // static late Box<CommissionHiveModel> motorCommissionBox;

  static Future<void> init() async {
    print("Lost Hive initialized!!");
    Hive.registerAdapter(LostHiveModelAdapter());
    lostProductsBoxName =
        await Hive.openBox<LostHiveModel>(_lostProductsBoxName);
    // fDCommissionBox =
    //     await Hive.openBox<CommissionHiveModel>(_fDcommissionBoxName);
    // lifeCommissionBox =
    //     await Hive.openBox<CommissionHiveModel>(_lifecommissionBoxName);
    // motorCommissionBox =
    //     await Hive.openBox<CommissionHiveModel>(_motorcommissionBoxName);

    fetchlostsFromFirebase();
  }

  static Future<void> fetchlostsFromFirebase() async {
    print("my commission count 1");

    // fetchHealthCommissionFromFirebase();
    print("my commission count 2");

    final productsCollection = FirebaseFirestore.instance
        .collection('Lost')
        // .where("isSold", isNotEqualTo: true)
        // .where("type", isEqualTo: "Health")
        // .orderBy("commission_date")
        .get();

    productsCollection.then((snapshot) async {
      print(snapshot.docs.length.toString());
      await lostProductsBoxName.clear();
      // await fDCommissionBox.clear();
      // await lifeCommissionBox.clear();
      // await motorCommissionBox.clear();

      for (var doc in snapshot.docs) {
        final product = LostHiveModel.fromFirestore(doc);
        lostProductsBoxName.put(product.iD, product);

        // if (doc.data()['commission_type'] == 'Health') {
        //   healthCommissionBox.add(commission);
        // } else if (doc.data()['commission_type'] == 'Life') {
        //   lifeCommissionBox.add(commission);
        // } else if (doc.data()['commission_type'] == 'Motor') {
        //   motorCommissionBox.add(commission);
        // } else if (doc.data()['commission_type'] == 'FD') {
        //   fDCommissionBox.add(commission);
        // }
        // try {
        //   CommissionSearchController commissionController =
        //       Get.find<CommissionSearchController>(tag: ProductType.life.name);
        //   if (commissionController.initialized) {
        //     commissionController.reset();
        //   }
        // } catch (e) {
        //   print('Error caught by handler $e');
        // }

        // print('Adding before');
        // print(doc.id);
        // userBox.add(user);
        // print(
        //     "Commision adding ${commission.name} ${commission.commissionType}");
      }
      try {
        ResellSearchController resellController =
            Get.find<ResellSearchController>(tag: "");
        if (resellController.initialized) {
          resellController.reset();
        }
      } catch (e) {
        print('Error caught by handler $e');
      }
    });
  }

  // static void printAllCommissions() {
  //   // final userBox = Hive.box<UserHiveModel>(_userBoxName);
  //   for (var i = 0; i < commissionBox.length; i++) {
  //     final user = commissionBox.getAt(i);
  //     print('User ${i + 1}:');
  //     print('Name: ${user!.name}');
  //     // print('Address: ${user.address}');
  //     // print('Phone: ${user.phone}');
  //     // print('Email: ${user.email}');
  //     // print('Is Male: ${user.isMale}');
  //     // print('Date of Birth: ${user.dob}');
  //     // print('UserID: ${user.userid}');
  //     // print('Members Count: ${user.membersCount}');
  //     // print('------------------------');
  //   }
  // }

  static Future<void> updateSpecifiProduct({
    required String documentID,
  }) async {
    final resellCollection = FirebaseFirestore.instance.collection('Lost');
    final snapshot = await resellCollection.doc(documentID).get();

    print('updateSpecificProduct called for $documentID');

    final product = LostHiveModel.fromFirestore(snapshot);
    print('updateSpecificProduct called for ${product.itemName}');

    lostProductsBoxName.put(documentID, product);
    LostHiveModel? mod = lostProductsBoxName.get(
      documentID,
    );

    // product.productName = "hello";
    // product.save();
    print('updateSpecificProduct called for ${mod!.itemName}');
  }

  static void deleteSpecificCommission({required String documentID}) {
    // commissionBox.delete(documentID);
    // print('Adding ${policy.data!.name}');
  }

  static Future<void> deleteAllLostData() async {
    // final userBox = Hive.box<UserHiveModel>(_userBoxName);
    await lostProductsBoxName.clear();
    // await fDCommissionBox.clear();
    // await lifeCommissionBox.clear();
    // await motorCommissionBox.clear();
  }
}
