import 'package:flutter/material.dart';
import 'package:test/presentation/home/widgets/card_education_widget.dart';
import 'package:test/presentation/home/widgets/card_gradient_widget.dart';
import 'package:test/resources/my_images.dart';

import '../../figma/home_page_figma.dart';
import '../widgets/card_chart_widget.dart';
import '../widgets/card_financial_statement_widget.dart';
import 'homeT.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: currentPage);
  }

  setPaginaAtual(pagina) {
    setState(() {
      currentPage = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: PageView(
        // controller: pc,
        children: [
          ListView(
            children: [
              Column(
                children: const [
                  CardGradientWidget(),
                  CardFinancialStatementWidget(),
                  CardChartWidget(),
                  CardEducationWidget(),
                ],
              ),
            ],
          ),
          const PrintHomePageFigma(),
          Home(),
        ],
        onPageChanged: (value) {
          print('ir para função que atualiza staus da pagina');
          // currentPage =
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/help_home');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.help),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Transações'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Banco'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Carteira'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Mais'),
          // const BottomNavigationBarItem(
          //     icon: Icon(Icons.star), label: 'Favorito'),
          // const BottomNavigationBarItem(
          //     icon: Icon(Icons.settings), label: 'Configurações'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
