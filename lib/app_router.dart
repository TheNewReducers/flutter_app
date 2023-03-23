import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';

class AppRouter extends StatelessWidget {

  const AppRouter({super.key});

  Widget Function(BuildContext) getRouteBuilder(RouteSettings settings) {
    if (settings.name == '/') {
      return (context) => const HomeScreen();
    }

    return (context) => const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
