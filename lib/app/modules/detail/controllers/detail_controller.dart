import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/app/data/user_data_model.dart';
import '../../../data/providers/user_data_provider.dart';
import '../../../routes/app_pages.dart';

class DetailController extends GetxController {
  UserData userData = UserData();
  var txtNama = TextEditingController().obs;
  var txtEmail = TextEditingController().obs;
  var flagGender = "male".obs;
  var flagStatus = "active".obs;

  @override
  void onInit() {
    userData = Get.arguments['userData'];
    txtNama.value.text = userData.name!;
    txtEmail.value.text = userData.email!;
    flagGender.value = userData.gender!;
    flagStatus.value = userData.status!;
    super.onInit();
  }

  void selectGender(String selected) {
    flagGender.value = selected;
  }

  void selectStatus(String selected) {
    flagStatus.value = selected;
  }

  void updatePengguna() async {
    Get.dialog(AlertDialog(
      title: Text("Konfirmasi"),
      content: Text("Update Pengguna ?"),
      actions: [
        TextButton(
            onPressed: () async {
              Get.dialog(
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  barrierDismissible: false);

              List resultCreate = await UserDataProvider()
                  .executeCreateOrReplaceUserData(data: {
                "name": txtNama.value.text,
                "email": txtEmail.value.text,
                "gender": flagGender.value,
                "status": flagStatus.value
              }, methodType: "PUT", idPengguna: userData.id!);
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

  void deletePengguna() async {
    Get.dialog(AlertDialog(
      title: Text("Konfirmasi"),
      content: Text("Hapus Pengguna ?"),
      actions: [
        TextButton(
            onPressed: () async {
              Get.dialog(
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  barrierDismissible: false);

              String result = await UserDataProvider()
                  .deleteUserData(idPengguna: userData.id!);
              Get.back();
              if (result == "OK") {
                Get.offAllNamed(Routes.HOME);
              } else {
                Get.snackbar("Gagal Hapus Pengguna", "",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                    borderRadius: 0);
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
