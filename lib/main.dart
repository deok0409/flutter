import 'package:flutter/material.dart';
import 'package:testflutter/map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var titleSection = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [],
        ),
        SizedBox(height: 150),
        Text(""),
      ],
    );
    var SubtitleSection = const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: [],
        ),
        SizedBox(height: 50),
        Text("~~환영합니다~~"),
      ],
    );
    var imageSection = Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mainimg.png'),
        ),
      ),
    );
    // ignore: non_constant_identifier_names
    var ButtonSection = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(height: 100),
        Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                child: const Text("☆☆☆☆대여 위치보기"),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GoogleMapBody()),
                    )),
          ],
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('☆☆☆☆대여 서비스'),
        backgroundColor: Color(0xFF0F9D58),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            titleSection,
            SubtitleSection,
            imageSection,
            ButtonSection
          ],
        ),
      ),
    );
  }
}
