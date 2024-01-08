import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:upes_go/Hive/Hive_helpers/lost_hive_helper.dart';
import 'package:upes_go/Hive/Hive_models/commission_models/lost_hive_model.dart';

import '../Hive/Hive_helpers/resell_hive_helper.dart';
import '../Hive/Hive_models/commission_models/resell_hive_model.dart';
// import '/shared/exports.dart';

class LostSearchController extends GetxController {
  List<LostHiveModel> products = <LostHiveModel>[];
  Box<LostHiveModel>? productBox;
  TextEditingController searchController = TextEditingController();
  // final ProductType type;
  final bool isPending;

  int currentSum = 0;

  LostSearchController({
    // required this.type,
    required this.isPending,
  });
  String categoryFilter = 'Lost';
// TextEDo

  @override
  void onInit() {
    // Fetch user data from the Hive box
    print('Hive user LostSearchController init called');
    productBox = LostHiveHelper.lostProductsBoxName;

    // if (type == ProductType.health) {
    //   commissionBox = CommissionHiveHelper.healthCommissionBox;
    // } else if (type == ProductType.life) {
    //   commissionBox = CommissionHiveHelper.lifeCommissionBox;
    // } else if (type == ProductType.motor) {
    //   commissionBox = CommissionHiveHelper.motorCommissionBox;
    // } else {
    //   commissionBox = CommissionHiveHelper.fDCommissionBox;
    // }

    products.addAll(productBox!.values.toList());
    // getCompanies();
    super.onInit();
  }

  reset() {
    print('Calling LostSearchController reset function for Resell');
    productBox = LostHiveHelper.lostProductsBoxName;

    // if (type == ProductType.health) {
    //   commissionBox = CommissionHiveHelper.healthCommissionBox;
    // } else if (type == ProductType.life) {
    //   commissionBox = CommissionHiveHelper.lifeCommissionBox;
    // } else if (type == ProductType.motor) {
    //   commissionBox = CommissionHiveHelper.motorCommissionBox;
    // } else {
    //   commissionBox = CommissionHiveHelper.fDCommissionBox;
    // }
    products.addAll(productBox!.values.toList());
    filterProducts();
    update();
  }

  void filterProducts() {
    String query = searchController.text;

    print(query);
    products.clear();
    currentSum = 0;
    products = productBox!.values.where((product) {
      if (product.itemName.toLowerCase().contains(query.toLowerCase())) {
        if (true
            // categoryFilter == 'Featured' && product.isFeatured == true

            ) {
          if (

              // categoryFilter == 'All'
              // ||
              // categoryFilter == product.status
              true) {
            //isPending
            if (false
                // !product.isSold
                ) {
              return false;
            }
          } else {
            if (true
                // product.isSold
                ) {
              return false;
            }
          }

          // currentSum += product.commissionAmt;
          return true;
        }
      }

      return false;
    }).toList();
    update();
  }

  void changeCategory(String newCompany) {
    categoryFilter = newCompany;
    filterProducts();
  }
}
