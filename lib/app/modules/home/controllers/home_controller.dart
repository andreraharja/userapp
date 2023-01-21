import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/app/data/providers/user_data_provider.dart';
import 'package:userapp/app/data/user_data_model.dart';
import 'package:userapp/app/routes/app_pages.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var lsResult = List<UserData>.empty().obs;
  List<UserData> lsUserData = [];
  var initPage = 0.obs;
  final scrollController = ScrollController();

  @override
  void onInit() async {
    isLoading(true);
    loadUserData();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        loadUserData();
      }
    });
    super.onInit();
  }

  void loadUserData() async {
    initPage.value += 1;
    lsUserData = await UserDataProvider().getUserData(pageData: initPage.value);
    lsResult.addAll(lsUserData);
    isLoading(false);
  }

  void toCreatePage() async {
    Get.toNamed(Routes.CREATE);
  }

  toDetailPage(int index) {
    Get.toNamed(Routes.DETAIL, arguments: {"userData": lsUserData[index]});
  }

  void getDataFromSearch(String value) async {
    isLoading(true);
    UserData result =
        await UserDataProvider().getUserDataFromSearch(idPengguna: value);
    lsResult.clear();
    if (result.status!.contains("Tidak Ditemukan")) {
      if (value == "") {
        lsResult.value =
            await UserDataProvider().getUserData(pageData: initPage.value);
      } else {
        lsResult.value = [];
      }
    } else {
      lsResult.add(result);
    }
    isLoading(false);
  }
}
