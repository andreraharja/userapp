import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_controller.dart';

class CreateViewStatus extends StatelessWidget {
  const CreateViewStatus({
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
            child: Text('Status')),
        Text(': '),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            children: [
              Radio(
                value: 'active',
                groupValue: controller.flagStatus.value,
                onChanged: (_) {
                  controller.selectStatus('active');
                },
              ),
              Text('Active'),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Row(
            children: [
              Radio(
                value: 'inactive',
                groupValue: controller.flagStatus.value,
                onChanged: (value) {
                  controller.selectStatus('inactive');
                },
              ),
              Text('Inactive'),
            ],
          ),
        ),
      ],
    ));
  }
}

