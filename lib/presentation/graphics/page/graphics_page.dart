import 'package:flutter/material.dart';

import '../../../resources/colors.dart';
import '../widgets/category_widget.dart';
import '../widgets/pie_chart_categories_widget.dart';

class GraphicsPage extends StatefulWidget {
  const GraphicsPage({super.key});

  @override
  State<GraphicsPage> createState() => _GraphicsPageState();
}

class _GraphicsPageState extends State<GraphicsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Despesas por categorias',
          ),
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Color(0xFF645FFB),
                  Color(0xFF05EDE3),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    Color(0xFF645FFB),
                    Color(0xFF05EDE3),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 870,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteSnow,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        const PieChartSample7(
                          percentageOne: 10,
                          percentageTwo: 10,
                          percentageThree: 10,
                          percentageFour: 10,
                          percentageFive: 10,
                          percentageSix: 10,
                          percentageSeven: 10,
                          percentageEight: 30,
                          colorOne: Colors.green,
                          colorTwo: Colors.blue,
                          colorThree: Colors.amber,
                          colorFour: Colors.red,
                          colorFive: Colors.brown,
                          colorSix: Colors.black,
                          colorSeven: Colors.purple,
                          colorEight: Colors.pink,
                        ),
                        Column(
                          children: const [
                            CategoryWidget(
                              color: Colors.green,
                              category: 'Alimentação',
                              totalValue: 1000,
                              percentage: 10,
                            ),
                            CategoryWidget(
                              color: Colors.blue,
                              category: 'Saúde',
                              totalValue: 1000,
                              percentage: 10,
                            ),
                            CategoryWidget(
                              color: Colors.amber,
                              category: 'Pessoal',
                              totalValue: 1000,
                              percentage: 10,
                            ),
                            CategoryWidget(
                              color: Colors.red,
                              category: 'Lazer',
                              totalValue: 1000,
                              percentage: 10,
                            ),
                            CategoryWidget(
                              color: Colors.brown,
                              category: 'Transporte',
                              totalValue: 1000,
                              percentage: 10,
                            ),
                            CategoryWidget(
                              color: Colors.black,
                              category: 'Casa',
                              totalValue: 1000,
                              percentage: 10,
                            ),
                            CategoryWidget(
                              color: Colors.purple,
                              category: 'Educação',
                              totalValue: 1000,
                              percentage: 10,
                            ),
                            CategoryWidget(
                              color: Colors.pink,
                              category: 'Outras despesas',
                              totalValue: 3000,
                              percentage: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
