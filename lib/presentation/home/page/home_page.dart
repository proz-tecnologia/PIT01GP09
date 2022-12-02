import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:test/presentation/home/controller/transaction_controller.dart';
import 'package:test/presentation/home/controller/transaction_state.dart';
import 'package:test/presentation/home/widgets/card_chart_widget.dart';
import 'package:test/presentation/home/widgets/card_education_widget.dart';
import 'package:test/presentation/home/widgets/card_financial_statement_widget.dart';
import 'package:test/presentation/home/widgets/card_gradient_widget.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/strings.dart';

import '../../../resources/shared_widgets/transaction_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    final transactionController =
        Provider.of<TransactionController>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      transactionController.getTransactionList();
    });
  }

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
                      valueListenable: transactionController,
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
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: AppColors.blueVibrant,
          overlayOpacity: 0.4,
          children: [
            SpeedDialChild(
              backgroundColor: AppColors.redWine,
              child: const Icon(Icons.remove),
              label: Strings.expense,
              onTap: () => Navigator.pushNamed(context, '/add_expense'),
            ),
            SpeedDialChild(
              backgroundColor: AppColors.greenVibrant,
              child: const Icon(Icons.add),
              label: Strings.income,
              onTap: () => Navigator.pushNamed(context, '/add_income'),
            ),
          ],
        ),
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
