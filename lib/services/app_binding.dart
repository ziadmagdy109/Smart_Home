import 'package:get/get.dart';
import 'package:smart_home/services/api_crud_services.dart';
import 'package:smart_home/services/local_storage_manager.dart';
import 'package:smart_home/services/token_manager.dart';
import 'package:smart_home/view_model/user_view_model.dart';

class AppBinding extends Bindings {

  @override
  void dependencies() {
    Get.put<TokenManager>(TokenManager());
    Get.put<LocalStorageManager>(LocalStorageManager());
    Get.put<APICrudServices>(APICrudServices());
  }
}