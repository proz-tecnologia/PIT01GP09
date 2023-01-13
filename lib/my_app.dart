import 'package:flutter/material.dart';
import 'package:test/presentation/forgot_password/page/forgot_password_page.dart';
import 'package:test/presentation/profile/page/profile_page.dart';

import 'presentation/expenses/page/add_expense_page.dart';
import 'presentation/income/page/add_income_page.dart';
import 'presentation/expenses/page/expenses_page.dart';
import 'presentation/home/page/home_page.dart';
import 'presentation/income/page/income_page.dart';
import 'resources/shared_widgets/numeric_keyboard_page.dart';
import 'presentation/login/page/login_page.dart';
import 'presentation/sign_up/page/sign_up_page.dart';
import 'presentation/splash/page/splash_page.dart';
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
      initialRoute: '/splash',
      routes: {
        '/login': (context) => const LoginPage(),
        '/forgot': (context) => const ForgotPasswordPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/transactions': (context) => const TransactionsPage(),
        '/expenses': (context) => const ExpensesPage(),
        '/income': (context) => const IncomePage(),
        '/add_income': (context) => const AddIncomePage(),
        '/add_expense': (context) => const AddExpensePage(),
        '/keyboard': (context) => const NumericKeyboardPage(),
        '/splash': (context) => const SplashPage(),
      },
    );
  }
}
