import 'package:flutter/material.dart';
import 'package:iconable_avatar/iconable_avatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconableAvatar(
              avatar: const CircleAvatar(
                backgroundColor: Colors.orangeAccent,
                radius: 50.0,
                child: Text('AM'),
              ),
              onIconTap: () {
                print('Hi :)');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            IconableAvatar(
              avatar: const CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 100.0,
                child: Text('AM'),
              ),
              onIconTap: () {
                print('Hi :)');
              },
            ),
            const SizedBox(
              height: 10,
            ),
            IconableAvatar(
              avatar: const CircleAvatar(
                backgroundColor: Colors.pink,
                radius: 150.0,
                child: Text('AM'),
              ),
              icon: Icons.remove,
              backgroundIconColor: const Color.fromRGBO(255, 255, 255, 0.4),
              iconColor: Colors.red,
              onIconTap: () {
                print('Hi :)');
              },
            ),
          ],
        ),
      ),
    );
  }
}
