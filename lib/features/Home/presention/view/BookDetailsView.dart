import 'package:bookly_app/constants.dart';
import 'package:bookly_app/features/Home/data/models/BookModel.dart';
import 'package:bookly_app/features/Home/presention/view/widgets/BookDetailsViewBody.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.model, required this.books});
final Items model;
final List<Items>books;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(icon:const Icon( FontAwesomeIcons.xmark),onPressed: () {
Get.back();
        },),
        actions: [
          IconButton(onPressed: () {

          }, icon:const Icon(FontAwesomeIcons.cartShopping))
        ],
      ),
      body:  BookDetailsViewBody(model: model,books:books ),
    );
  }
}
