import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/app/modules/home/views/home_view_search.dart';
import '../controllers/home_controller.dart';
import 'home_view_list.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Column(
          children: [
            HomeViewSearch(controller: controller),
            Expanded(
              child: Obx(() => controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : showDataUser(context)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => controller.toCreatePage(), label: Icon(Icons.add)),
    );
  }

  Widget showDataUser(BuildContext context) {
    if (controller.lsResult.length == 0) {
      return Center(child: Text('Pengguna Tidak Ditemukan'));
    } else {
      return HomeViewList(controller: controller);
    }
  }
}
