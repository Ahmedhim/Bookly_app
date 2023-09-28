import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/Search/presention/views/widgets/SearchViewBody.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
title: TextField(
  onTap: () {

  },
  decoration: const InputDecoration(
    hintText: "Search",suffixIcon: Icon(Icons.search),
    suffixIconColor: Colors.white,
    border: InputBorder.none,
    hintStyle: TextStyle(color: Colors.white),
  ),
),
      ),
      body: const SearchViewBody(),
    );
  }
}
