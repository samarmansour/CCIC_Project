/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskes_project/home.dart';
import 'package:taskes_project/profile.dart';
class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarExampleState createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {

  var currentTab = [
   Home(),
   profile()
   
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavigationBarProvider>(context);
    return Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        onTap: (index) {
          provider.currentIndex = index;
        },
      items: 
        <BottomNavigationBarItem> [ 
          BottomNavigationBarItem(label: "My Home",icon: Icon(Icons.home)),
          
          BottomNavigationBarItem(label: "My Account", icon: Icon(Icons.person),)
          ],
      ),
    );
  }
}

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
*/