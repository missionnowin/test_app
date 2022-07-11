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
      page: InitPage,
      initial: true
    ),

    //Авторизация
    AutoRoute(
      path: '/login',
      name: 'LoginPages',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          path: 'auth_page',
          page: AuthPage,
          name: 'AuthPageRoute',
          initial: true,
        ),
        AutoRoute(
            name: 'RegistrationPageRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                name: 'EmployerRegistration',
                path: 'registration_page',
                page: RegistrationPage,
                initial: true
              ),
            ]
        )
      ],
    ),

    //Основные страницы
    AutoRoute(
      path: '/main_pages',
      name: 'MainPageRoute',
      page: MainPage,
      children: [
        AutoRoute(
          name: 'HomeRoute',
          path: 'home_page',
          page: HomePage,
        ),
        AutoRoute(
            page: EmptyRouterPage,
            name: 'ProfileRoute',
            path: 'profile',
            children: [
              AutoRoute(
                path: 'profile_page',
                name: 'ProfilePageRoute',
                initial: true,
                page: ProfilePage,
              ),
              AutoRoute(
                path: 'profile_update_page',
                name: 'ProfileUpdatePageRoute',
                page: ProfilePageUpdate,
              )
            ]
        )
      ],
    ),
  ],
)

class AppRouter extends _$AppRouter {}

