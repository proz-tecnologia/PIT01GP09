import 'package:finance_app/presentation/home/widgets/pie_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../resources/colors.dart';
import '../../home/widgets/card_chart_widget.dart';

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
                        const PieChartSample2(
                            percentageOne: 70,
                            percentageTwo: 30,
                            colorOne: Colors.green,
                            colorTwo: Colors.blue),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Saúde'),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        'R\$ 2.000,00',
                                      ),
                                      Text(
                                        '70%',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.circle,
                                        color: Colors.blue,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Educação'),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: const [
                                      Text(
                                        'R\$ 857,14',
                                      ),
                                      Text(
                                        '30%',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
