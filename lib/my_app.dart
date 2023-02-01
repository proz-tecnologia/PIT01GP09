import 'package:finance_app/presentation/forgot_password/page/forgot_password_page.dart';
import 'package:finance_app/presentation/profile/page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'presentation/graphics/page/graphics_page.dart';
import 'presentation/expenses/page/expenses_page.dart';
import 'presentation/home/page/home_page.dart';
import 'presentation/income/page/income_page.dart';
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
      title: 'finance_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.grey),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt'),
      ],
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
        '/graphics': (context) => const GraphicsPage(),
        '/splash': (context) => const SplashPage(),
      },
    );
  }
}
