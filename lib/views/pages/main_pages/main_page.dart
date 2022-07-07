// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:test_app/service/icons/icons.dart';
import 'package:test_app/views/pages/main_pages/profile/profile_page.dart';


import 'home/home_page.dart';


class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            label: 'Главная',
            icon: Icon(MyFlutterApp.home),
          ),
          BottomNavigationBarItem(
            label: 'Новости',
            icon: Icon(MyFlutterApp.news),
          ),
          BottomNavigationBarItem(
            label: 'Вакансии',
            icon: Icon(MyFlutterApp.vacancies),
          ),
          BottomNavigationBarItem(
            label: 'Тесты',
            icon: Icon(MyFlutterApp.tests),
          ),
          BottomNavigationBarItem(
            label: 'Профиль',
            icon: Icon(MyFlutterApp.profile),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
