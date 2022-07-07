import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app/views/pages/init_page.dart';
import 'package:test_app/views/pages/login/registration_page.dart';
import 'package:test_app/views/pages/main_pages/profile/profile_update_page.dart';
import '../../views/pages/login/auth_page.dart';
import '../../views/pages/main_pages/home/home_page.dart';
import '../../views/pages/main_pages/main_page.dart';
import '../../views/pages/main_pages/profile/profile_page.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    //Начальная
    AutoRoute(
      path: '/',
      page: InitPage,
      name: 'InitPageRoute',
      initial: true
    ),

    //Авторизация
    AutoRoute(
      path: '/login',
      name: 'LoginPages',
      children: [
        AutoRoute(
          path: 'auth_page',
          page: AuthPage,
          name: 'AuthPageRoute',
          initial: true,
        ),
        AutoRoute(
          name: 'RegistrationPageRoute',
          path: 'registration_page',
          page: RegistrationPage,
        ),
      ],
    ),

    //Основные страницы
    AutoRoute(
      path: '/main_pages',
      name: 'MainPageRoute',
      page: MainPage,
      children: [
        AutoRoute(
          path: 'home',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              name: 'HomeRoute',
              path: 'home_page',
              page: HomePage,
            ),
          ],
        ),
        AutoRoute(
          path: 'profile',
          name: 'ProfileRoutes',
          page: EmptyRouterPage,
          children: [
            AutoRoute(
              path: 'profile_page',
              name: 'ProfilePageRoutes',
              page: ProfilePage,
              children: [
                AutoRoute(
                  path: 'profile_update_page',
                  name: 'ProfileUpdatePageRoutes',
                  page: ProfilePageUpdate,
                )
              ]
            )
          ]
        )
      ],
    ),
  ],
)

class AppRouter extends _$AppRouter {}

