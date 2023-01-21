import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/app/data/providers/user_data_provider.dart';
import 'package:userapp/app/routes/app_pages.dart';

class CreateController extends GetxController {
  var txtNama = TextEditingController().obs;
  var txtEmail = TextEditingController().obs;
  var flagGender = "male".obs;
  var flagStatus = "active".obs;

  void selectGender(String selected) {
    flagGender.value = selected;
  }

  void selectStatus(String selected) {
    flagStatus.value = selected;
  }

  void buatPengguna() {
    Get.dialog(AlertDialog(
      title: Text("Konfirmasi"),
      content: Text("Buat User Baru?"),
      actions: [
        TextButton(
            onPressed: () async {
              Get.dialog(
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  barrierDismissible: false);

              List resultCreate =
                  await UserDataProvider().createUserData(data: {
                "name": txtNama.value.text,
                "email": txtEmail.value.text,
                "gender": flagGender.value,
                "status": flagStatus.value
              });
              Get.back();
              if (resultCreate[1] == null) {
                Get.offAllNamed(Routes.HOME);
              } else {
                Get.snackbar(resultCreate[1] + ' ' + resultCreate[2], "",
                    snackPosition: SnackPosition.BOTTOM,
                    borderRadius: 0,
                    backgroundColor: Colors.red,
                    colorText: Colors.white);
              }
            },
            child: Text('Ya')),
        TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Tidak')),
      ],
    ));
  }
}
