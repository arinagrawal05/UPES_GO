import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:upes_go/Hive/Hive_helpers/lost_hive_helper.dart';
import 'package:upes_go/Hive/Hive_helpers/resell_hive_helper.dart';

class HiveHelper {
  static void init() async {
    await Hive.initFlutter();
    // UserHiveHelper.init();
    ResellHiveHelper.init();
    LostHiveHelper.init();
    // PolicyHiveHelper.init();
  }
}
