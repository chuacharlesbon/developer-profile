import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myflutterprofile/core/utils/change_favicon.dart';
import 'package:myflutterprofile/resources/constants/urls.dart';
import 'package:seo/seo.dart';
import 'package:url_launcher/url_launcher.dart';

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
    //changeMeta();
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
        onPressed: () {
          final url = Uri.parse("oma://okadamanila.com?test=true");
          canLaunchUrl(url).then((canLaunch) {
            if (canLaunch) {
              launchUrl(
                url,
                mode: LaunchMode.externalApplication,
              );
            }
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
