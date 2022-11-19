import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/presentation/home/controller/transaction_controller.dart';
import 'package:test/presentation/home/controller/transaction_state.dart';
import 'package:test/presentation/home/widgets/card_chart_widget.dart';
import 'package:test/presentation/home/widgets/card_education_widget.dart';
import 'package:test/presentation/home/widgets/card_financial_statement_widget.dart';
import 'package:test/presentation/home/widgets/card_gradient_widget.dart';
import 'package:test/resources/colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  void onItemPressed(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionController = context.watch<TransactionController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.graySuperLight,
        body: Center(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CardGradientWidget(),
                  const CardFinancialStatementWidget(),
                  SizedBox(
                    height: 200,
                    //color: AppColors.blueVibrant,
                    child: ValueListenableBuilder<TransactionState>(
                      valueListenable: transactionController,
                      builder: (_, state, __) {
                        if (state is TransactionLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is TransactionSuccessState) {
                          return Container(
                            height: 100,
                            color: Colors.red,
                            width: 20,
                            child: ListView.builder(
                              itemCount: state.transactionListModel.length,
                              itemBuilder: ((context, index) {
                                final transactionItem =
                                    state.transactionListModel[index];
                                return ListTile(
                                  leading: Text(
                                    transactionItem.type,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  title: Text(transactionItem.description),
                                  subtitle: Text(transactionItem.category),
                                );
                              }),
                            ),
                          );
                        }
                        if (state is TransactionErrorState) {
                          return Center(
                            child: Text(state.message),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CardChartWidget(),
                  const CardEducationWidget(),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.blueVibrant,
          onPressed: () {},
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.blueVibrant,
          unselectedItemColor: AppColors.grayTwo,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.currency_exchange), label: 'Transações'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: 'Bancos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'Mais'),
          ],
          onTap: onItemPressed,
        ),
      ),
    );
  }
}
