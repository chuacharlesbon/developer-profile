import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myflutterprofile/core/utils/change_favicon.dart';
import 'package:myflutterprofile/resources/constants/urls.dart';
import 'package:seo/seo.dart';

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
    changeMeta();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('Current Route: ${GoRouter.of(context).location}');
    return Seo.head(
      tags: const [
        MetaTag(
          name: "description",
          content: "Developer Portfolio - Charles Bon Chua: Full Stack Developer; Frontend React and Flutter, Backend Nodejs."),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
      )
    );
  }
}
