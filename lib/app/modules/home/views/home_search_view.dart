import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';

class HomeSearchView extends StatelessWidget {
  const HomeSearchView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: TextFormField(
        enableSuggestions: false,
        autocorrect: false,
        onChanged: (value) {
          // context.read<SearchdataBloc>().add(SetDataSearch(
          //     txtSearch: value,
          //     selectedOption: stateSearch.selectedOption,
          //     choiceIndex: stateSearch.choiceIndex,
          //     page: stateSearch.page));
        },
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: 'Search',
        ),
      ),
    );
  }
}
