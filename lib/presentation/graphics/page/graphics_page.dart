import 'package:flutter/material.dart';

import '../../../data/models/transactions_model.dart';
import '../../../locator.dart';
import '../../../resources/colors.dart';
import '../controller/graphics_controller.dart';
import '../controller/graphics_state.dart';
import '../widgets/category_widget.dart';
import '../widgets/pie_chart_categories_widget.dart';

class GraphicsPage extends StatefulWidget {
  const GraphicsPage({super.key});

  @override
  State<GraphicsPage> createState() => _GraphicsPageState();
}

class _GraphicsPageState extends State<GraphicsPage> {
  final graphicsController = GraphicsController(
      authRepository: getIt(), transactionsRepository: getIt());

  @override
  void initState() {
    super.initState();
    graphicsController.fetchTransactions();
  }

  double getTotalExpense(List<TransactionsModel> transactionsList) {
    late double totalExpense = 0;
    for (var transaction in transactionsList) {
      if (transaction.type == 'Despesa') {
        totalExpense += transaction.value;
      }
    }
    return totalExpense;
  }

  List<double> getExpensesByCategory(List<TransactionsModel> transactionsList) {
    late double totalAlimentacao = 0;
    late double totalSaude = 0;
    late double totalPessoal = 0;
    late double totalLazer = 0;
    late double totalTransporte = 0;
    late double totalCasa = 0;
    late double totalEducacao = 0;
    late double totalOutras = 0;
    for (var transaction in transactionsList) {
      if (transaction.category == 'Alimentação') {
        totalAlimentacao += transaction.value;
      }
      if (transaction.category == 'Saúde') {
        totalSaude += transaction.value;
      }
      if (transaction.category == 'Pessoal') {
        totalPessoal += transaction.value;
      }
      if (transaction.category == 'Lazer') {
        totalLazer += transaction.value;
      }
      if (transaction.category == 'Transporte') {
        totalTransporte += transaction.value;
      }
      if (transaction.category == 'Casa') {
        totalCasa += transaction.value;
      }
      if (transaction.category == 'Educação') {
        totalEducacao += transaction.value;
      }
      if (transaction.category == 'Outras despesas') {
        totalOutras += transaction.value;
      }
    }

    final expensesByCategoryList = [
      totalAlimentacao,
      totalSaude,
      totalPessoal,
      totalLazer,
      totalTransporte,
      totalCasa,
      totalEducacao,
      totalOutras
    ];
    return expensesByCategoryList;
  }

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
        body: ValueListenableBuilder<GraphicsState>(
            valueListenable: graphicsController.state,
            builder: (_, state, __) {
              if (state is GraphicsStateLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.blueVibrant,
                ));
              }
              if (state is GraphicsStateError) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is GraphicsStateSuccess) {
                return ListView(
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
                            height: 800,
                            decoration: const BoxDecoration(
                              color: AppColors.whiteSnow,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                PieChartSample7(
                                  percentageOne: getExpensesByCategory(
                                      state.transactions.value)[0],
                                  percentageTwo: getExpensesByCategory(
                                      state.transactions.value)[1],
                                  percentageThree: getExpensesByCategory(
                                      state.transactions.value)[2],
                                  percentageFour: getExpensesByCategory(
                                      state.transactions.value)[3],
                                  percentageFive: getExpensesByCategory(
                                      state.transactions.value)[4],
                                  percentageSix: getExpensesByCategory(
                                      state.transactions.value)[5],
                                  percentageSeven: getExpensesByCategory(
                                      state.transactions.value)[6],
                                  percentageEight: getExpensesByCategory(
                                      state.transactions.value)[7],
                                  colorOne: AppColors.amberPeach,
                                  colorTwo: AppColors.greenVibrant,
                                  colorThree: Colors.orange,
                                  colorFour: AppColors.purpleFlower,
                                  colorFive: AppColors.redWine,
                                  colorSix: AppColors.blueVibrant,
                                  colorSeven: Colors.purple,
                                  colorEight: AppColors.grayTwo,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      CategoryWidget(
                                        color: AppColors.amberPeach,
                                        category: 'Alimentação',
                                        totalValue: getExpensesByCategory(
                                            state.transactions.value)[0],
                                        percentage: getExpensesByCategory(
                                                state.transactions.value)[0] /
                                            getTotalExpense(
                                                state.transactions.value) *
                                            100,
                                      ),
                                      CategoryWidget(
                                        color: AppColors.greenVibrant,
                                        category: 'Saúde',
                                        totalValue: getExpensesByCategory(
                                            state.transactions.value)[1],
                                        percentage: getExpensesByCategory(
                                                state.transactions.value)[1] /
                                            getTotalExpense(
                                                state.transactions.value) *
                                            100,
                                      ),
                                      CategoryWidget(
                                        color: Colors.orange,
                                        category: 'Pessoal',
                                        totalValue: getExpensesByCategory(
                                            state.transactions.value)[2],
                                        percentage: getExpensesByCategory(
                                                state.transactions.value)[2] /
                                            getTotalExpense(
                                                state.transactions.value) *
                                            100,
                                      ),
                                      CategoryWidget(
                                        color: AppColors.purpleFlower,
                                        category: 'Lazer',
                                        totalValue: getExpensesByCategory(
                                            state.transactions.value)[3],
                                        percentage: getExpensesByCategory(
                                                state.transactions.value)[3] /
                                            getTotalExpense(
                                                state.transactions.value) *
                                            100,
                                      ),
                                      CategoryWidget(
                                        color: AppColors.redWine,
                                        category: 'Transporte',
                                        totalValue: getExpensesByCategory(
                                            state.transactions.value)[4],
                                        percentage: getExpensesByCategory(
                                                state.transactions.value)[4] /
                                            getTotalExpense(
                                                state.transactions.value) *
                                            100,
                                      ),
                                      CategoryWidget(
                                        color: AppColors.blueVibrant,
                                        category: 'Casa',
                                        totalValue: getExpensesByCategory(
                                            state.transactions.value)[5],
                                        percentage: getExpensesByCategory(
                                                state.transactions.value)[5] /
                                            getTotalExpense(
                                                state.transactions.value) *
                                            100,
                                      ),
                                      CategoryWidget(
                                        color: Colors.purple,
                                        category: 'Educação',
                                        totalValue: getExpensesByCategory(
                                            state.transactions.value)[6],
                                        percentage: getExpensesByCategory(
                                                state.transactions.value)[6] /
                                            getTotalExpense(
                                                state.transactions.value) *
                                            100,
                                      ),
                                      CategoryWidget(
                                        color: AppColors.grayTwo,
                                        category: 'Outras despesas',
                                        totalValue: getExpensesByCategory(
                                            state.transactions.value)[7],
                                        percentage: getExpensesByCategory(
                                                state.transactions.value)[7] /
                                            getTotalExpense(
                                                state.transactions.value) *
                                            100,
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
                  ],
                );
              }
              return Container();
            }),
      ),
    );
  }
}
