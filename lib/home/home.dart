import 'package:flutter/material.dart';
import 'package:newsfeed/home/favorites.dart';

import 'news.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<Map<String,Widget>> pages=[
    {
      'page' : News()
    },
    {
      'page' : Favorites()
    }
  ];
  int selectedIndex=0;
  void selectPage(int index){
    setState(() {
      selectedIndex=index;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber.shade700,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "News",

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",

          )
        ],

      ),
    );
  }
}
