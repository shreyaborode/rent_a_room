import 'package:flutter/material.dart';
import 'homepage.dart';
import 'PostDetails.dart';
import 'notification.dart';
import 'users.dart';

class HouseScreen extends StatefulWidget {
  const HouseScreen({Key? key}) : super(key: key);
  @override
  State<HouseScreen> createState() => _HouseScreenState();
}

class _HouseScreenState extends State<HouseScreen> {

  int currentIndex =0;
  final List screens = [
    HomePage(),
    Post(),
    Notify(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.red.shade200,
        iconSize: 22,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index) =>setState(() =>currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add_a_photo), label: 'Post'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline_rounded), label: 'Activity'),


          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),

    );
  }
}