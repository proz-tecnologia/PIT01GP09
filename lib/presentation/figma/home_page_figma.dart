import 'package:flutter/material.dart';
import 'package:test/resources/my_images.dart';

class PrintHomePageFigma extends StatelessWidget {
  const PrintHomePageFigma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Print da Home (Figma)')),
      body: Center(child: Image.asset(imgHomeFigma)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/home');
        },
        child: const Icon(Icons.navigate_before),
      ),
    );
  }
}
