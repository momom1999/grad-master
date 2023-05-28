import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  Category category;
  int index;
  Function onClickItem;

  CategoryGridView(
      {required this.category, required this.index, required this.onClickItem});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: () {
          
          onClickItem(category);
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: category.categoryBackground,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(category.categoryImage),
              Text(
                category.categoryTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Category {
  String categoryID;
  String categoryImage;
  String categoryTitle;
  Color categoryBackground;

  Category(
      {required this.categoryID,
      required this.categoryImage,
      required this.categoryTitle,
      required this.categoryBackground});
}
