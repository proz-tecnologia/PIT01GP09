import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/presentation/home/controller/transactions_state_success.dart';
import 'package:finance_app/presentation/transactions/widgets/transactions_group_widget.dart';
import 'package:finance_app/resources/shared_widgets/month_carousel_widget.dart';
import 'package:finance_app/utils/date_util.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class TransactionsPageSuccess extends StatelessWidget {
  final TransactionStateSuccess state;
  const TransactionsPageSuccess({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MonthCarouselWidget(
            onSelectMonthYear: state.applyFilter,
            monthsList: state.monthsList,
          ),
          SizedBox(
            height: 500,
            width: double.maxFinite,
            child: ValueListenableBuilder(
                valueListenable: state.transactions,
                builder: (context, transactions, __) {
                  var listByDay = groupBy(
                    transactions,
                    (TransactionsModel e) =>
                        ('${e.date.day.toString()} de ${(e.date).getMonthIntoString()}'),
                  );
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: listByDay.length,
                    itemBuilder: (BuildContext context, int index) {
                      int reverseIndex = listByDay.length - 1 - index;
                      return TransactionsGroupWidget(
                        index: reverseIndex,
                        mapListByDay: listByDay,
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
