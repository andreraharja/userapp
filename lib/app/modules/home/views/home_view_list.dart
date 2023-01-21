import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class HomeViewList extends StatelessWidget {
  const HomeViewList({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: controller.lsUserData.length,
        itemBuilder: (context, index) {
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
                        controller.lsUserData[index].id.toString()),
                    SizedBox(
                      height: 5,
                    ),
                    displayData(context, index, "Nama",
                        controller.lsUserData[index].name.toString()),
                    SizedBox(
                      height: 5,
                    ),
                    displayData(context, index, "Email",
                        controller.lsUserData[index].email.toString()),
                    SizedBox(
                      height: 5,
                    ),
                    displayData(context, index, "Gender",
                        controller.lsUserData[index].gender.toString()),
                    SizedBox(
                      height: 5,
                    ),
                    displayData(context, index, "Status",
                        controller.lsUserData[index].status.toString()),
                  ],
                ),
              ),
            ),
          );
        });
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
