import 'package:flutter/material.dart';
import 'package:test/locator.dart';
import 'package:test/presentation/home/controller/transactions_controller.dart';
import 'package:test/presentation/home/controller/transactions_state.dart';
import 'package:test/presentation/home/widgets/card_chart_widget.dart';
import 'package:test/presentation/home/widgets/card_education_widget.dart';
import 'package:test/presentation/home/widgets/card_financial_statement_widget.dart';
import 'package:test/presentation/home/widgets/card_gradient_widget.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/strings.dart';
import '../../../resources/shared_widgets/transaction_card_widget.dart';
import '../widgets/add_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int currentIndex = 0;

  final transactionsController = TransactionsController(
      authRepository: getIt(), transactionsRepository: getIt());

  @override
  void initState() {
    super.initState();
    transactionsController.getTransactionsList();
  }

  void onItemPressed(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.graySuperLight,
        body: Center(
          child: ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CardGradientWidget(),
                  const CardFinancialStatementWidget(),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 20),
                    child: Text(
                      Strings.recents,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ValueListenableBuilder<TransactionState>(
                      valueListenable: transactionsController,
                      builder: (_, state, __) {
                        if (state is TransactionLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: AppColors.blueVibrant,
                          ));
                        }
                        if (state is TransactionSuccessState) {
                          return TransactionCardWidget(
                            transactionsList: state.transactionListModel,
                            cardColor: AppColors.whiteSnow,
                            leftPadding: 16,
                            rightPadding: 16,
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
        floatingActionButton: const AddMenu(color: AppColors.blueVibrant),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColors.blueVibrant,
          unselectedItemColor: AppColors.grayTwo,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () => Navigator.of(context).pushNamed('/transactions'),
                  child: const Icon(
                    Icons.currency_exchange,
                  ),
                ),
                label: 'Transações'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), label: 'Bancos'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz), label: 'Mais'),
          ],
          onTap: onItemPressed,
        ),
      ),
    );
  }
}
