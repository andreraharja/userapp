import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeViewList extends StatelessWidget {
  const HomeViewList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
          controller: controller.scrollController,
          itemCount: controller.lsResult.length + 1,
          itemBuilder: (context, index) {
            if (index == controller.lsResult.length) {
              if (controller.lsResult.length > 9) {
                return SizedBox(
                  width: double.infinity,
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )),
                );
              } else {
                return Container();
              }
            } else {
              return InkWell(
                onTap: () => controller.toDetailPage(index),
                child: Container(
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        displayData(context, index, "ID",
                            controller.lsResult[index].id.toString()),
                        SizedBox(
                          height: 5,
                        ),
                        displayData(context, index, "Nama",
                            controller.lsResult[index].name.toString()),
                        SizedBox(
                          height: 5,
                        ),
                        displayData(context, index, "Email",
                            controller.lsResult[index].email.toString()),
                        SizedBox(
                          height: 5,
                        ),
                        displayData(context, index, "Gender",
                            controller.lsResult[index].gender.toString()),
                        SizedBox(
                          height: 5,
                        ),
                        displayData(context, index, "Status",
                            controller.lsResult[index].status.toString()),
                      ],
                    ),
                  ),
                ),
              );
            }
          }),
    );
  }

  Widget displayData(
      BuildContext context, int index, String title, String data) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: Colors.grey),
              )),
          Text(": "),
          Expanded(
            child: Text(
              data,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
