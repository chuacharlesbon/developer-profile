import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:myflutterprofile/core/utils/change_favicon.dart';
import 'package:myflutterprofile/resources/constants/urls.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    changeFavicon(GlobalUrls.homeIconPath);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('Current Route: ${GoRouter.of(context).location}');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Html(
              data: '''
                <meta property="og:type" content="website" />
                <meta property="og:url" content="https://chuacharlesbon.github.io/portfolio-chua/" />
                <meta property="og:site_name" content="Developer's Portfolio" />
                <meta property="og:title" content="Charles Chua - Full Stack Developer">
                <meta property="og:description" content="Developer Portfolio - Charles Bon Chua: Full Stack Developer; Frontend React and Flutter, Backend Nodejs">
                <meta property="og:image" content="https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=4096x4096">
              ''',
            ),
            const Text(
              'My Profile',
            ),
            Text(
              'Hello',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}