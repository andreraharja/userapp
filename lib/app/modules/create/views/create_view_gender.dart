import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_controller.dart';

class CreateViewGender extends StatelessWidget {
  const CreateViewGender({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CreateController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Text('Gender')),
        Text(': '),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            children: [
              Radio(
                value: 'male',
                groupValue: controller.flagGender.value,
                onChanged: (_) {
                  controller.selectGender('male');
                },
              ),
              Text('Male'),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            children: [
              Radio(
                value: 'female',
                groupValue: controller.flagGender.value,
                onChanged: (value) {
                  controller.selectGender('female');
                },
              ),
              Text('Female'),
            ],
          ),
        ),
      ],
    ));
  }
}
