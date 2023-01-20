import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:userapp/app/modules/home/views/home_search_view.dart';
import '../controllers/home_controller.dart';
import 'home_list_view.dart';

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
            HomeSearchView(controller: controller),
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
    if (controller.lsUserData.length == 0) {
      return Text('User Not Available');
    } else if (controller.lsUserData.length == 0) {
      return Text('User Not Found');
    } else {
      return HomeListView(controller: controller);
    }
  }
}
