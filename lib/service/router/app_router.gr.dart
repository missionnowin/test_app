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
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: AuthPage(key: args.key));
    },
    MainPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const MainPage());
    },
    RegistrationRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const RegistrationPage());
    },
    EmptyRouterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    ProfileRoutes.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    ProfilePageRoutes.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePage());
    },
    ProfileUpdatePageRoutes.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePageUpdate());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect',
            path: '/', redirectTo: '/login', fullMatch: true),
        RouteConfig(AuthRoute.name, path: '/login', children: [
          RouteConfig(RegistrationRoute.name,
              path: 'registration_page', parent: AuthRoute.name)
        ]),
        RouteConfig(MainPageRoute.name, path: '/main_pages', children: [
          RouteConfig(EmptyRouterRoute.name,
              path: 'home',
              parent: MainPageRoute.name,
              children: [
                RouteConfig(HomeRoute.name,
                    path: 'home_page', parent: EmptyRouterRoute.name)
              ]),
          RouteConfig(ProfileRoutes.name,
              path: 'profile',
              parent: MainPageRoute.name,
              children: [
                RouteConfig(ProfilePageRoutes.name,
                    path: 'profile_page',
                    parent: ProfileRoutes.name,
                    children: [
                      RouteConfig(ProfileUpdatePageRoutes.name,
                          path: 'profile_update_page',
                          parent: ProfilePageRoutes.name)
                    ])
              ])
        ])
      ];
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({Key? key, List<PageRouteInfo>? children})
      : super(AuthRoute.name,
            path: '/login',
            args: AuthRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'AuthRoute';
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
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
/// [RegistrationPage]
class RegistrationRoute extends PageRouteInfo<void> {
  const RegistrationRoute()
      : super(RegistrationRoute.name, path: 'registration_page');

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [EmptyRouterPage]
class EmptyRouterRoute extends PageRouteInfo<void> {
  const EmptyRouterRoute({List<PageRouteInfo>? children})
      : super(EmptyRouterRoute.name, path: 'home', initialChildren: children);

  static const String name = 'EmptyRouterRoute';
}

/// generated route for
/// [EmptyRouterPage]
class ProfileRoutes extends PageRouteInfo<void> {
  const ProfileRoutes({List<PageRouteInfo>? children})
      : super(ProfileRoutes.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRoutes';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home_page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoutes extends PageRouteInfo<void> {
  const ProfilePageRoutes({List<PageRouteInfo>? children})
      : super(ProfilePageRoutes.name,
            path: 'profile_page', initialChildren: children);

  static const String name = 'ProfilePageRoutes';
}

/// generated route for
/// [ProfilePageUpdate]
class ProfileUpdatePageRoutes extends PageRouteInfo<void> {
  const ProfileUpdatePageRoutes()
      : super(ProfileUpdatePageRoutes.name, path: 'profile_update_page');

  static const String name = 'ProfileUpdatePageRoutes';
}
