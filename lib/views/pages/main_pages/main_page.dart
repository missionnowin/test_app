// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/views/pages/main_pages/profile/profile_page.dart';
import 'package:test_app/views/pages/main_pages/tests/tests_page.dart';
import 'package:test_app/views/pages/main_pages/vacancies/vacancies_page.dart';
import '../../../logic/blocs/user_bloc/user_bloc.dart';
import '../../../service/router/app_router.dart';
import '../../widgets/bottom_navigation_bar.dart';
import 'home/home_page.dart';
import 'news/news_page.dart';


class MainPage extends StatefulWidget{
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = [
    const HomePage(),
    const NewsPage(),
    const VacanciesPage(),
    const TestsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserInitial) {
          AutoRouter.of(context).replace(const LoginPages());
        }
      },
      builder: (context, state) {
        if (state is UserInitial) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return AutoTabsRouter(
          routes: const [
            HomeRoute(),
            NewsRoute(),
            VacanciesRoute(),
            TestsRoute(),
            ProfileRoute(),
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
    );
  }
}
