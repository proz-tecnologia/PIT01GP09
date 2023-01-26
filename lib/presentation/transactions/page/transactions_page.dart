import 'dart:developer';

import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/locator.dart';
import 'package:finance_app/presentation/home/controller/transactions_controller.dart';
import 'package:finance_app/presentation/home/controller/transactions_state.dart';
import 'package:finance_app/presentation/transactions/widgets/bottom_sheet_transactions_widget.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:finance_app/resources/shared_widgets/month_carousel_widget.dart';
import 'package:finance_app/resources/strings.dart';
import 'package:finance_app/utils/date_util.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../../home/widgets/add_menu.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  final transactionsController = TransactionsController(
      authRepository: getIt(), transactionsRepository: getIt());
      
  @override
  void initState() {
    super.initState();
    transactionsController.getTransactionsList();
    transactionsController.fetchTransactionListFromRepository();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).popAndPushNamed('/home');
              },
              child: const Icon(
                Icons.arrow_back,
              )),
          title: const Text(Strings.transactions,
              style: TextStyle(
                fontSize: 18,
              )),
          elevation: 0,
          flexibleSpace: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: AppColors.purpleFlower,
          ),
        ),
        body: ValueListenableBuilder<TransactionState>(
          valueListenable: transactionsController,
          builder: (_, state, __) {
            final list = transactionsController.transactionsList;
            var listByDay = groupBy(
              list,
              (TransactionsModel e) =>
                  ('${e.date.day.toString()} de ${(e.date).getMonthIntoString()}'),
            );
            log('$listByDay', name: 'ListByDay >>>>');

            if (state is TransactionLoadingState) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.greenVibrant,
              ));
            }
            if (state is TransactionSuccessState) {
              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MonthCarouselWidget(
                      onSelectMonthYear:
                          transactionsController.filterTransactionList,
                      monthsList: transactionsController.monthsList,
                    ),
                    SizedBox(
                      height: 500,
                      width: double.maxFinite,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: listByDay.length,
                        itemBuilder: (BuildContext context, int index) {
                          int reverseIndex = listByDay.length - 1 - index;

                          final dateKey =
                              listByDay.keys.elementAt(reverseIndex);

                          final listValuesMap =
                              listByDay.values.elementAt(reverseIndex);
                          log('teste');

                          return Column(
                            children: [
                              SizedBox(
                                height: 33,
                                child: Row(
                                  children: [
                                    Text(
                                      dateKey,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              for (var item in listValuesMap)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Container(
                                    height: 60,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      color: AppColors.graySuperLight,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: AppColors.graySuperLight,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, top: 16, right: 8),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CircleAvatar(
                                            maxRadius: 10,
                                            backgroundColor:
                                                item.type == 'Despesa'
                                                    ? AppColors.redWine
                                                    : AppColors.greenVibrant,
                                            child: Center(
                                              child: item.type == 'Despesa'
                                                  ? const Icon(
                                                      Icons
                                                          .keyboard_arrow_down_outlined,
                                                      size: 20,
                                                      color:
                                                          AppColors.whiteSnow,
                                                    )
                                                  : const Icon(
                                                      Icons
                                                          .keyboard_arrow_up_outlined,
                                                      size: 20,
                                                      color:
                                                          AppColors.whiteSnow,
                                                    ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.description,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.blackSwan,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  item.category,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: AppColors.grayDark,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              item.type == 'Despesa'
                                                  ? 'R\$ ${(double.parse(item.value.toString()).toStringAsFixed(2))}'
                                                  : 'R\$ ${(double.parse(item.value.toString()).toStringAsFixed(2))}',
                                              style: TextStyle(
                                                color: item.type == 'Despesa'
                                                    ? AppColors.redWine
                                                    : AppColors.greenVibrant,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
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
        bottomSheet: const BottomSheetTransactionsWidget(),
        floatingActionButton: const Padding(
          padding: EdgeInsets.only(bottom: 60.0),
          child: AddMenu(color: AppColors.purpleFlower),
        ),
      ),
    );
  }
}
