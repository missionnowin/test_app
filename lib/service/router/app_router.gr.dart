// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    InitRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const InitPage());
    },
    LoginPages.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    MainPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainPage());
    },
    AuthPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const AuthPage());
    },
    RegistrationPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    EmployerRegistration.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RegistrationPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ProfileRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    NewsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const NewsPage());
    },
    VacanciesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const VacanciesPage());
    },
    TestsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const TestsPage());
    },
    ProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePage());
    },
    ProfileUpdatePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePageUpdate());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(InitRoute.name, path: '/'),
        RouteConfig(LoginPages.name, path: '/login', children: [
          RouteConfig('#redirect',
              path: '',
              parent: LoginPages.name,
              redirectTo: 'auth_page',
              fullMatch: true),
          RouteConfig(AuthPageRoute.name,
              path: 'auth_page', parent: LoginPages.name),
          RouteConfig(RegistrationPageRoute.name,
              path: 'empty-router-page',
              parent: LoginPages.name,
              children: [
                RouteConfig('#redirect',
                    path: '',
                    parent: RegistrationPageRoute.name,
                    redirectTo: 'registration_page',
                    fullMatch: true),
                RouteConfig(EmployerRegistration.name,
                    path: 'registration_page',
                    parent: RegistrationPageRoute.name)
              ])
        ]),
        RouteConfig(MainPageRoute.name, path: '/main_pages', children: [
          RouteConfig(HomeRoute.name,
              path: 'home_page', parent: MainPageRoute.name),
          RouteConfig(ProfileRoute.name,
              path: 'profile',
              parent: MainPageRoute.name,
              children: [
                RouteConfig('#redirect',
                    path: '',
                    parent: ProfileRoute.name,
                    redirectTo: 'profile_page',
                    fullMatch: true),
                RouteConfig(ProfilePageRoute.name,
                    path: 'profile_page', parent: ProfileRoute.name),
                RouteConfig(ProfileUpdatePageRoute.name,
                    path: 'profile_update_page', parent: ProfileRoute.name)
              ]),
          RouteConfig(NewsRoute.name,
              path: 'news_page', parent: MainPageRoute.name),
          RouteConfig(VacanciesRoute.name,
              path: 'vacancies_page', parent: MainPageRoute.name),
          RouteConfig(TestsRoute.name,
              path: 'tests_page', parent: MainPageRoute.name)
        ])
      ];
}

/// generated route for
/// [InitPage]
class InitRoute extends PageRouteInfo<void> {
  const InitRoute() : super(InitRoute.name, path: '/');

  static const String name = 'InitRoute';
}

/// generated route for
/// [EmptyRouterPage]
class LoginPages extends PageRouteInfo<void> {
  const LoginPages({List<PageRouteInfo>? children})
      : super(LoginPages.name, path: '/login', initialChildren: children);

  static const String name = 'LoginPages';
}

/// generated route for
/// [MainPage]
class MainPageRoute extends PageRouteInfo<void> {
  const MainPageRoute({List<PageRouteInfo>? children})
      : super(MainPageRoute.name,
            path: '/main_pages', initialChildren: children);

  static const String name = 'MainPageRoute';
}

/// generated route for
/// [AuthPage]
class AuthPageRoute extends PageRouteInfo<void> {
  const AuthPageRoute() : super(AuthPageRoute.name, path: 'auth_page');

  static const String name = 'AuthPageRoute';
}

/// generated route for
/// [EmptyRouterPage]
class RegistrationPageRoute extends PageRouteInfo<void> {
  const RegistrationPageRoute({List<PageRouteInfo>? children})
      : super(RegistrationPageRoute.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'RegistrationPageRoute';
}

/// generated route for
/// [RegistrationPage]
class EmployerRegistration extends PageRouteInfo<void> {
  const EmployerRegistration()
      : super(EmployerRegistration.name, path: 'registration_page');

  static const String name = 'EmployerRegistration';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home_page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [EmptyRouterPage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(ProfileRoute.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [NewsPage]
class NewsRoute extends PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news_page');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [VacanciesPage]
class VacanciesRoute extends PageRouteInfo<void> {
  const VacanciesRoute() : super(VacanciesRoute.name, path: 'vacancies_page');

  static const String name = 'VacanciesRoute';
}

/// generated route for
/// [TestsPage]
class TestsRoute extends PageRouteInfo<void> {
  const TestsRoute() : super(TestsRoute.name, path: 'tests_page');

  static const String name = 'TestsRoute';
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<void> {
  const ProfilePageRoute() : super(ProfilePageRoute.name, path: 'profile_page');

  static const String name = 'ProfilePageRoute';
}

/// generated route for
/// [ProfilePageUpdate]
class ProfileUpdatePageRoute extends PageRouteInfo<void> {
  const ProfileUpdatePageRoute()
      : super(ProfileUpdatePageRoute.name, path: 'profile_update_page');

  static const String name = 'ProfileUpdatePageRoute';
}
