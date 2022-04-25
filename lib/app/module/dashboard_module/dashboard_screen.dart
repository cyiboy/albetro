import 'package:albetro/app/core/theme/color_theme.dart';
import 'package:albetro/app/module/dashboard_module/book_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../trip_module/trip_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;
  int _pageIndex = 0;
  late PageController _pageController;
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Surface,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[BookScreen(), TripScreen()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Primary,
        unselectedItemColor: textColor,
        backgroundColor: Surface,
        currentIndex: _currentIndex, //New
        onTap: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active_rounded),
            label: 'book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'trip',
          ),
        ],
      ),
    );
  }
}
