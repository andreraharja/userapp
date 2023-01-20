import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/app/data/providers/user_data_provider.dart';
import 'package:userapp/app/routes/app_pages.dart';

class CreateController extends GetxController {
  var txtNama = TextEditingController().obs;
  var txtEmail = TextEditingController().obs;

  var flagGender = "Male".obs;
  String txtGender = "";

  var flagStatus = "Active".obs;
  String txtStatus = "";

  void selectGender(String selected) {
    txtGender = selected;
    flagGender.value = selected;
  }

  void selectStatus(String selected) {
    txtStatus = selected;
    flagStatus.value = selected;
  }

  void buatPengguna() async {
    if (txtGender != "" && txtStatus != "") {
      List resultCreate = await UserDataProvider().createUserData(data: {
        "name": txtNama.value.text,
        "email": txtEmail.value.text,
        "gender": txtGender,
        "status": txtStatus
      });
      if (resultCreate[1] == null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar(resultCreate[1] + ' ' + resultCreate[2], "",
            snackPosition: SnackPosition.BOTTOM,
            borderRadius: 0,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      Get.snackbar("Harap Memilih Gender dan Status", "",
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 0,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
