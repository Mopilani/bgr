import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as urlLancher;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter + Nima'),
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
  String _animationName = "idle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      urlLancher.launchUrl(Uri.parse('tel:+249-113-615012'));
                    },
                    child: const Text("Telphone"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      urlLancher.launchUrl(Uri.parse('sms:113615012'));
                    },
                    child: const Text("SMS"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      urlLancher.launchUrl(Uri.parse(
                          'mailto:mopilani1@gmail.com?subject=News&body=New%20plugin'));
                    },
                    child: const Text("Email"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: MaterialButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      urlLancher.launchUrl(Uri.parse('file:/home'));
                    },
                    child: const Text("Folder"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
