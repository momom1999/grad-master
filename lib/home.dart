import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad/category_list.dart';
import 'package:grad/main.dart';
import 'package:grad/screens/login_view.dart';
import 'category_grid_view.dart';




class HomeScreen extends StatefulWidget {
static const String routeName = 'home';



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Category>category=[

    Category(categoryID: "pets",
      categoryImage: "assets/images/body of seb7a.png",
      categoryTitle: "pets",
      categoryBackground: const Color.fromRGBO(0, 128, 128, 100) ,
    ),


  Category(categoryID: "cats",
  categoryImage: "assets/images/body of seb7a.png",
  categoryTitle: "pets",
  categoryBackground: const Color.fromRGBO(0, 128, 128, 100) ,
  ),
    Category(categoryID: "woo",
      categoryImage: "assets/images/body of seb7a.png",
      categoryTitle: "pets",
      categoryBackground: const Color.fromRGBO(0, 128, 128, 100)
    ),
    Category(categoryID: "dogs",
      categoryImage: "assets/images/body of seb7a.png",
      categoryTitle: "pets",
      categoryBackground: const Color.fromRGBO(0, 128, 128, 100) ,
    ),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.teal,

        elevation: 0,
        title:  Text(
          selectedCategory==null?'Paws': selectedCategory!.categoryTitle,style:TextStyle(
          fontSize: 22,fontWeight: FontWeight.w400
        ) ,),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )
        ),
      ),
      drawer: Drawer(  child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 45),
            width: double.infinity,
            height: 120,
            color: Colors.teal,
            child: Text('Vezeeta',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),
              textAlign: TextAlign.center,),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){},
              child: InkWell(
                onTap: (){setState(() {
                  selectedCategory=null;
                  Navigator.pop(context);
                });},
                child: Row(
                  children: [
                    const Icon(
                      Icons.menu,size: 30,),
                    SizedBox(width: 10,),
                    Text("Categories",style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,color: Colors.black,)
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){},
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,size: 30,),
                  SizedBox(width: 10,),
                  Text("Settings",style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,color: Colors.black,)
                  )
                ],
              ),
            ),
          ), Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
              setState(() {
                Navigator.pushReplacementNamed(context, LoginScreen.routeName);

              });},
              child: Row(
                children: [
                  const Icon(
                    Icons.logout,size: 30,),
                  SizedBox(width: 10,),
                  Text("Log Out",style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.bold,color: Colors.black,)
                  )
                ],
              ),

              ),
            ),


        ],
      )

      ),


      body: selectedCategory==null? Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30,),
            const Text(
              "Pick your category",style:TextStyle(fontSize:26,color: Colors.teal)
              ),
SizedBox(height: 30,),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 6/7,
                ),

                itemBuilder: (context,index)=>CategoryGridView(
                    index:index,category: category[index],onClickItem:onClick ,),
              itemCount:category.length ,
              ),
            ),
          ],
        ),

      ) :CategoryList(selectedCategory!),
    );
  }
   Category?selectedCategory=null;
  void onClick(Category category){
    setState(() {
      selectedCategory=category;
    });
  }
}
