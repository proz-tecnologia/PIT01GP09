import 'package:flutter/material.dart';
import 'package:test/locator.dart';
import 'package:test/presentation/splash/controller/splash_controller.dart';
import 'package:test/presentation/splash/controller/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final splashController = SplashController(authRepository: getIt());
  @override
  void initState() {
    super.initState();
    setState(() {
      splashController.getUser();
      splashController.notifier.addListener(() {
        if (splashController.state is SplashAuthenticated) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/home', (route) => false);
        } else {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/login', (route) => false);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Splash Screen',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
