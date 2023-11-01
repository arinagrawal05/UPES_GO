// import '../hive/hive_model/policy_models/generic_investment_data.dart';
// import 'exports.dart';

import 'package:avatar_stack/positions.dart';

class AppConsts {
  static String careEmail1 = "arinagrawal07128@gmail.com";
  static String careEmail2 = "ayushagr2000@gmail.com";
  static String appName = "UPES GO";
  static String appUserNick = "Upesites";
  static String appUserNicks = "Upesite";
}

class TermConsts {
  static List<String> resellCate = [
    "Electronics",
    "Games",
    "Books",
    "Accessories",
    "Stationery",
    "Sports",
    "Others",
  ];
}

class PropConst {
  static final settings = RestrictedPositions(
    maxCoverage: -0.3,
    minCoverage: 0.5,
    align: StackAlign.left,
  );
}
