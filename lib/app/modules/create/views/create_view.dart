import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/create_controller.dart';
import 'create_view_email.dart';
import 'create_view_gender.dart';
import 'create_view_name.dart';
import 'create_view_status.dart';

class CreateView extends GetView<CreateController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create User'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    CreateViewName(controller: controller),
                    SizedBox(
                      height: 20,
                    ),
                    CreateViewEmail(controller: controller),
                    SizedBox(
                      height: 15,
                    ),
                    CreateViewGender(controller: controller),
                    CreateViewStatus(controller: controller)
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.buatPengguna();
                      },
                      child: Text('Buat Pengguna')))
            ],
          ),
        ),
      ),
    );
  }
}
