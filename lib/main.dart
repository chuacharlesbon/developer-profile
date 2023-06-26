import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:myflutterprofile/components/app_title_builder.dart';
import 'package:myflutterprofile/presentations/home/home_screen.dart';
import 'package:myflutterprofile/presentations/splash/splash_screen.dart';
import 'package:myflutterprofile/resources/constants/colors.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Meta SEO
  if (kIsWeb) {
    MetaSEO().config();
  }

  // Here we set the URL strategy for our web app.
  // This will remove /#/
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {

    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // Add meta seo data for web app as you want
      meta.author(author: 'Charles Bon Chua');
      meta.keywords(keywords: 'Flutter, Dart, React, Developer, Software engineer');
      meta.ogTitle(ogTitle: 'Developer Portfolio');
      meta.ogDescription(ogDescription: 'Developer Portfolio - Charles Bon Chua: Full Stack Developer; Frontend React and Flutter, Backend Nodejs.');
      meta.ogImage(ogImage: 'https://github.com/chuacharlesbon/portfolio-chua/blob/master/images/og-image.png?raw=true');
    }

    return MaterialApp.router(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'My Profile',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalColors.primaryColor,
              width: 1.5,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalColors.primaryColor,
              width: 1.5,
            ),
          ),
          errorStyle: TextStyle(color: Colors.red),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: GlobalColors.primaryColor,
              width: 1.5,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(routes: [
    ShellRoute(
      pageBuilder: (context, state, child) => NoTransitionPage(
        child: AppTitleBuilder(
          child: child,
        ),
      ),
      routes: <GoRoute>[
        /////////////////////////////////
        /// Products
        /////////////////////////////////
        // path: /
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => const MaterialPage(
            child: kIsWeb
              ? MyHomePage(title: 'My Profile')
              : SplashScreen(title: 'My Profile'),
          ),
        ),
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => const MaterialPage(
            child: MyHomePage(title: 'My Profile'),
          ),
        ),
        // path: /collections
      ],
    ),
  ]);
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
