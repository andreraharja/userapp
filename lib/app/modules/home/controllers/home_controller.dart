import 'package:get/get.dart';
import 'package:userapp/app/data/providers/user_data_provider.dart';
import 'package:userapp/app/data/user_data_model.dart';
import 'package:userapp/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var lsUserData = List<UserData>.empty().obs;

  @override
  void onInit() async {
    lsUserData.value = await UserDataProvider().getUserData();
    isLoading(false);
    super.onInit();
  }

  void toCreatePage() async {
    Get.toNamed(Routes.CREATE);
  }

  toDetailPage() {
    Get.toNamed(Routes.DETAIL);
  }
}
