import 'package:flutter/material.dart';
import 'package:test/presentation/expenses/page/expenses_page.dart';
import 'package:test/presentation/income/page/income_page.dart';
import 'presentation/home/page/home_page.dart';
import 'presentation/transactions/page/transactions_page.dart';

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
        '/home': (context) => const HomePage(),
        '/transactions': (context) => const TransactionsPage(),
        '/expenses': (context) => const ExpensesPage(),
        '/income': (context) => const IncomePage(),
      },
    );
  }
}
