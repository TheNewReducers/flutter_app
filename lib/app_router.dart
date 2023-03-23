import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/tipps_screen.dart';
import 'package:flutter_app/services/navigation_service.dart';

class AppRouter extends StatelessWidget {

  const AppRouter({super.key});

  Widget Function(BuildContext) getRouteBuilder(RouteSettings settings) {
    if (settings.name == '/') {
      return (context) => const HomeScreen();
    }

    if (settings.name == '/tipps') {
      return (context) => const TippsScreen();
    }

    return (context) => const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    NavigationService navigationService = NavigationService.instance;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationService.navigatorKey,
      onGenerateRoute: (settings) {
        final routeBuilder = getRouteBuilder(settings);
        return MaterialPageRoute(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: routeBuilder(context),
          )
        );
      },
    );
  }
}
