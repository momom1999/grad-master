import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/category_list.dart';
import 'package:grad/core/theme.dart';
import 'package:grad/main.dart';
import 'package:grad/screens/home/login_client/login_view.dart';
import 'category_grid_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> category = [
    Category(
      categoryID: "clinic",
      categoryImage: "assets/images/p3.png",
      categoryTitle: "Clinic",
      categoryBackground: const Color.fromRGBO(0, 10, 50, 100),
    ),
    Category(
      categoryID: "shelter",
      categoryImage: "assets/images/p1.png",
      categoryTitle: "Shelter",
      categoryBackground: const Color.fromRGBO(0, 10, 50, 100),
    ),
    Category(
        categoryID: "store",
        categoryImage: "assets/images/p4.png",
        categoryTitle: "Store",
        categoryBackground: const Color.fromRGBO(0, 10, 50, 100)),
    Category(
      categoryID: "tips",
      categoryImage: "assets/images/p2.png",
      categoryTitle: "Tips",
      categoryBackground: const Color.fromRGBO(0, 10, 50, 100),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          selectedCategory == null ? 'Paws' : selectedCategory!.categoryTitle,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
          child: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 45),
            width: double.infinity,
            height: 120,
            color: MyTheme.lightPrimary,
            child: const Text(
              'Paws',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedCategory = null;
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Categories",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF000A32),
                            ))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pushReplacementNamed(
                      context, LoginScreen.routeName);
                });
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Log Out",
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000A32),
                          ))
                ],
              ),
            ),
          ),
        ])
      ])),
      body: selectedCategory == null
          ? Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  const Text("Pick your category",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000A32))),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 6 / 7,
                      ),
                      itemBuilder: (context, index) => CategoryGridView(
                        index: index,
                        category: category[index],
                        onClickItem: onClick,
                      ),
                      itemCount: category.length,
                    ),
                  ),
                ],
              ),
            )
          : CategoryList(selectedCategory!),
    );
  }

  Category? selectedCategory = null;
  void onClick(Category category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
