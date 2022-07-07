// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_app/service/icons/icons.dart';
import 'package:test_app/views/pages/main_pages/profile/profile_page.dart';


import '../../../service/router/app_router.dart';
import '../../widgets/bottom_navigation_bar.dart';
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
    ProfilePageRoute(),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        HomeRoute(),
        HomeRoute(),
        HomeRoute(),
        HomeRoute(),
        ProfilePageRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomBottomNavigationBar(
            tabsRouter: tabsRouter,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
            },
          ),
        );
      },
    );
  }
}
