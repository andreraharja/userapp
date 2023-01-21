import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class DetailViewEmail extends StatelessWidget {
  const DetailViewEmail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
      controller: controller.txtEmail.value,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email *',
          floatingLabelBehavior: FloatingLabelBehavior.always),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Harap mengisi Email';
        }
        return null;
      },
    ));
  }
}
