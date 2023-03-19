import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/view_models/users_view_model.dart';
import 'package:flutter_application_2/views/home_screen.dart';
// ignore: library_prefixes
import 'package:url_launcher/url_launcher.dart' as urlLancher;
import 'package:provider/provider.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var key = utf8.encode('p@ssw0rd');
    var bytes = utf8.encode(
      "AQAAAAAAAAAAAAAAAAAAAACHZDnaEzDcEa1uHpN7AqAMMMExIPFNFngP8oLkulwS9/D2fJ0JT13jw5peNaW/XeC/wjgIuWf4U0D5EvJoZ0Wk0GjX5fKuBmm+az/GXF53vaN48cSFt8mYJe7LLcSSVVf+b0KHTCKsbGwdDlW3Og3Lf2kYBKIFJUGhIVI6pyHAlLApUdZFK2AzhyCMh5e4i8sOmAN8A5KARRLFtlYrf2nEYo+paQ3oELLQnHnmdeYWZJus7h4hqk6YZd+xVOR5qvtnVGFQHZBW1ectXSnS6TO6kqT6hicQaaln9EIXHdWROv059IePDcv8HSdojogmypILsOZ+CPSV+YF2+7vBZ9f/",
    );

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);

    print("HMAC digest as bytes: ${digest.bytes}");
    print("HMAC digest as hex string: $digest");

    ///
    ///
    var time = DateTime.fromMillisecondsSinceEpoch(130223063619);
    print('Time is: $time');

    ///
    print('=========================================');
    // print(json.decode())
    var file = File('data.json');
    var jsnStr = file.readAsStringSync();
    var map = json.decode(jsnStr);
    print(map);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UsersViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter MVVM',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // body: Stack(
      //   children: <Widget>[
      //     Positioned.fill(
      //       child: Row(
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: <Widget>[
      //           Container(
      //             margin: const EdgeInsets.all(5.0),
      //             child: MaterialButton(
      //               textColor: Colors.white,
      //               color: Colors.blue,
      //               onPressed: () {
      //                 urlLancher.launchUrl(Uri.parse('tel:+249-113-615012'));
      //               },
      //               child: const Text("Telphone"),
      //             ),
      //           ),
      //           Container(
      //             margin: const EdgeInsets.all(5.0),
      //             child: MaterialButton(
      //               textColor: Colors.white,
      //               color: Colors.blue,
      //               onPressed: () {
      //                 urlLancher.launchUrl(Uri.parse('sms:113615012'));
      //               },
      //               child: const Text("SMS"),
      //             ),
      //           ),
      //           Container(
      //             margin: const EdgeInsets.all(5.0),
      //             child: MaterialButton(
      //               textColor: Colors.white,
      //               color: Colors.blue,
      //               onPressed: () {
      //                 urlLancher.launchUrl(Uri.parse(
      //                     'mailto:mopilani1@gmail.com?subject=News&body=New%20plugin'));
      //               },
      //               child: const Text("Email"),
      //             ),
      //           ),
      //           Container(
      //             margin: const EdgeInsets.all(5.0),
      //             child: MaterialButton(
      //               textColor: Colors.white,
      //               color: Colors.blue,
      //               onPressed: () {
      //                 urlLancher.launchUrl(Uri.parse('file:/home'));
      //               },
      //               child: const Text("Folder"),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
