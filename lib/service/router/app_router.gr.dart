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
      final args = routeData.argsAs<AuthPageRouteArgs>(
          orElse: () => const AuthPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: AuthPage(key: args.key));
    },
    RegistrationPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    EmployerRegistration.name: (routeData) {
      final args = routeData.argsAs<EmployerRegistrationArgs>(
          orElse: () => const EmployerRegistrationArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: RegistrationPage(key: args.key));
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: HomePage(key: args.key));
    },
    ProfilePage.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    ProfilePageRoute.name: (routeData) {
      final args = routeData.argsAs<ProfilePageRouteArgs>(
          orElse: () => const ProfilePageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: ProfilePage(key: args.key));
    },
    ProfileUpdatePageRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileUpdatePageRouteArgs>(
          orElse: () => const ProfileUpdatePageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData, child: ProfilePageUpdate(key: args.key));
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
          RouteConfig(ProfilePage.name,
              path: 'profile',
              parent: MainPageRoute.name,
              children: [
                RouteConfig('#redirect',
                    path: '',
                    parent: ProfilePage.name,
                    redirectTo: 'profile_page',
                    fullMatch: true),
                RouteConfig(ProfilePageRoute.name,
                    path: 'profile_page', parent: ProfilePage.name),
                RouteConfig(ProfileUpdatePageRoute.name,
                    path: 'profile_update_page', parent: ProfilePage.name)
              ])
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
/// [EmptyRouterPage]
class RegistrationPageRoute extends PageRouteInfo<void> {
  const RegistrationPageRoute({List<PageRouteInfo>? children})
      : super(RegistrationPageRoute.name,
            path: 'empty-router-page', initialChildren: children);

  static const String name = 'RegistrationPageRoute';
}

/// generated route for
/// [RegistrationPage]
class EmployerRegistration extends PageRouteInfo<EmployerRegistrationArgs> {
  EmployerRegistration({Key? key})
      : super(EmployerRegistration.name,
            path: 'registration_page',
            args: EmployerRegistrationArgs(key: key));

  static const String name = 'EmployerRegistration';
}

class EmployerRegistrationArgs {
  const EmployerRegistrationArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'EmployerRegistrationArgs{key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key})
      : super(HomeRoute.name, path: 'home_page', args: HomeRouteArgs(key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [EmptyRouterPage]
class ProfilePage extends PageRouteInfo<void> {
  const ProfilePage({List<PageRouteInfo>? children})
      : super(ProfilePage.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfilePage';
}

/// generated route for
/// [ProfilePage]
class ProfilePageRoute extends PageRouteInfo<ProfilePageRouteArgs> {
  ProfilePageRoute({Key? key})
      : super(ProfilePageRoute.name,
            path: 'profile_page', args: ProfilePageRouteArgs(key: key));

  static const String name = 'ProfilePageRoute';
}

class ProfilePageRouteArgs {
  const ProfilePageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ProfilePageRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProfilePageUpdate]
class ProfileUpdatePageRoute extends PageRouteInfo<ProfileUpdatePageRouteArgs> {
  ProfileUpdatePageRoute({Key? key})
      : super(ProfileUpdatePageRoute.name,
            path: 'profile_update_page',
            args: ProfileUpdatePageRouteArgs(key: key));

  static const String name = 'ProfileUpdatePageRoute';
}

class ProfileUpdatePageRouteArgs {
  const ProfileUpdatePageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ProfileUpdatePageRouteArgs{key: $key}';
  }
}
