import 'package:flutter/material.dart';

import 'categories.dart';
import 'search.dart';
import 'trending.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentindex = 0;
  final List<Widget> _children = [
    TrendingPage(),
    CategoriesPage(),
    SearchPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onTap: (index) {
          setState(() {
            _currentindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), label: 'Trending'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'News'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
