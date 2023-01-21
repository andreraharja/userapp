import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/detail_controller.dart';
import 'detail_view_email.dart';
import 'detail_view_gender.dart';
import 'detail_view_name.dart';
import 'detail_view_status.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detail User'),
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
                    DetailViewName(controller: controller),
                    SizedBox(
                      height: 20,
                    ),
                    DetailViewEmail(controller: controller),
                    SizedBox(
                      height: 15,
                    ),
                    DetailViewGender(controller: controller),
                    DetailViewStatus(controller: controller)
                  ],
                ),
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        controller.updatePengguna();
                      },
                      child: Text('Simpan'))),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Text('Hapus Pengguna'),
                  onPressed: () {
                    controller.deletePengguna();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
