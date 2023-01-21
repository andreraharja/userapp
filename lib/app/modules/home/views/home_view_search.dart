import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class HomeViewSearch extends StatelessWidget {
  const HomeViewSearch({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: TextFormField(
        keyboardType:
            TextInputType.numberWithOptions(signed: false, decimal: false),
        enableSuggestions: false,
        autocorrect: false,
        onChanged: (value) {
          controller.getDataFromSearch(value);
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: 'Search by ID',
        ),
      ),
    );
  }
}
