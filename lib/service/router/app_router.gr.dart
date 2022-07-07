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
    InitPageRoute.name: (routeData) {
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
      final args = routeData.argsAs<AuthPageRouteArgs>(
          orElse: () => const AuthPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: AuthPage(key: args.key));
    },
    RegistrationPageRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationPageRouteArgs>(
          orElse: () => const RegistrationPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: RegistrationPage(key: args.key));
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
          routeData: routeData, child: HomePage());
    },
    ProfilePageRoutes.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: ProfilePage());
    },
    ProfileUpdatePageRoutes.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const ProfilePageUpdate());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig('/#redirect', path: '/', redirectTo: '', fullMatch: true),
        RouteConfig(InitPageRoute.name, path: ''),
        RouteConfig(LoginPages.name, path: '/login', children: [
          RouteConfig('#redirect',
              path: '',
              parent: LoginPages.name,
              redirectTo: 'auth_page',
              fullMatch: true),
          RouteConfig(AuthPageRoute.name,
              path: 'auth_page', parent: LoginPages.name),
          RouteConfig(RegistrationPageRoute.name,
              path: 'registration_page', parent: LoginPages.name)
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
/// [InitPage]
class InitPageRoute extends PageRouteInfo<void> {
  const InitPageRoute() : super(InitPageRoute.name, path: '');

  static const String name = 'InitPageRoute';
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
class AuthPageRoute extends PageRouteInfo<AuthPageRouteArgs> {
  AuthPageRoute({Key? key})
      : super(AuthPageRoute.name,
            path: 'auth_page', args: AuthPageRouteArgs(key: key));

  static const String name = 'AuthPageRoute';
}

class AuthPageRouteArgs {
  const AuthPageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthPageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RegistrationPage]
class RegistrationPageRoute extends PageRouteInfo<RegistrationPageRouteArgs> {
  RegistrationPageRoute({Key? key})
      : super(RegistrationPageRoute.name,
            path: 'registration_page',
            args: RegistrationPageRouteArgs(key: key));

  static const String name = 'RegistrationPageRoute';
}

class RegistrationPageRouteArgs {
  const RegistrationPageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegistrationPageRouteArgs{key: $key}';
  }
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
