import 'package:flutter/material.dart';
import 'presentation/figma/home_page_figma.dart';
import 'presentation/home/page/homeT.dart';
import 'presentation/home/page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'SOMAi Finance'),
      initialRoute: '/home',
      routes: {
        '/home': (context) => MyHomePage(title: 'SOMAi Finance'),
        '/help_home': (context) => PrintHomePageFigma(),
        '/homeT': (context) => Home(),
      },
    );
  }
}
