import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class DetailViewName extends StatelessWidget {
  const DetailViewName({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DetailController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
      controller: controller.txtNama.value,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text('Nama *'),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Harap mengisi Nama';
        }
        return null;
      },
    ));
  }
}