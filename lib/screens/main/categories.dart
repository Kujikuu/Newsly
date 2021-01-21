import 'package:Newsly/models/catcard.dart';
import 'package:Newsly/models/category.dart';
import 'package:Newsly/models/genNews.dart';
import 'package:Newsly/screens/main/newstile.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CategorieModel> categories = List<CategorieModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 25, right: 25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories'.toUpperCase(),
              style: TextStyle(color: Colors.orange, fontSize: 12),
            ),
            buildCategories(),
          ],
        ),
      ),
    );
  }

  Container buildCategories() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          // scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              imageAssetUrl: categories[index].imageAssetUrl,
              categoryName: categories[index].categorieName,
            );
          }),
    );
  }
}
