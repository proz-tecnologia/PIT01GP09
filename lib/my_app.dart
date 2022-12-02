import 'package:flutter/material.dart';
import 'package:test/presentation/add/page/add_expense_page.dart';
import 'package:test/presentation/add/page/add_income_page.dart';
import 'package:test/presentation/keyboard/page/numeric_keyboard_page.dart';
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
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MyHomePage(title: 'SOMAi Finance'),
        '/add_income': (context) => const AddIncomePage(),
        '/add_expense': (context) => const AddExpensePage(),
        '/keyboard': (context) => const NumericKeyboardPage(),
      },
    );
  }
}
