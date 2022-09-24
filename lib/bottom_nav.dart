import 'package:flutter/material.dart';
import 'package:taskes_project/category_API/ctegory_screen.dart';

import 'package:taskes_project/profile.dart';

import 'home.dart';

class bottom_navigation extends StatefulWidget {
  const bottom_navigation({Key? key}) : super(key: key);

  @override
  State<bottom_navigation> createState() => _bottom_navigationState();
}

class _bottom_navigationState extends State<bottom_navigation> {
  int currentIndex = 0;
  List<Widget>screens=
  [ 
 HomeScreen(),
 profile(),
 Category_screen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

       body: screens[currentIndex] ,


       bottomNavigationBar: 
       BottomNavigationBar(       
        items: 
        <BottomNavigationBarItem> [ 
          BottomNavigationBarItem(label: "My Home",icon: Icon(Icons.home)),
          
          BottomNavigationBarItem(label: "My Account", icon: Icon(Icons.person),),
              BottomNavigationBarItem(label: "category", icon: Icon(Icons.category ),)
          ],
          
           currentIndex: currentIndex,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            print("setstate");
          });
          print("current index is " + currentIndex.toString());

       
        },
        
          
       )
      


    );
  }
}

