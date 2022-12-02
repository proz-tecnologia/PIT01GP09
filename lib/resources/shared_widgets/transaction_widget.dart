import 'package:flutter/material.dart';
import 'package:test/data/models/transaction_model.dart';
import 'package:test/resources/colors.dart';
import 'package:test/resources/shared_widgets/transaction_card_widget.dart';

class TransactionWidget extends StatefulWidget {
  final String appBarTitle;
  final Color appBarColor;
  final String date;
  final List<TransactionModel> transactionsList;
  const TransactionWidget({
    super.key,
    required this.appBarColor,
    required this.appBarTitle,
    required this.date,
    required this.transactionsList,
  });

  @override
  State<TransactionWidget> createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).popAndPushNamed('/home');
            },
            child: const Icon(
              Icons.arrow_back,
            )),
        title: Text(widget.appBarTitle,
            style: const TextStyle(
              fontSize: 18,
            )),
        elevation: 0,
        flexibleSpace: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: widget.appBarColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.amber,
              height: 74,
              // child: MonthCarouselWidget(
              //   onSelectMonthYear: ,
              //   monthsList: ,
              // ),
            ),
            SizedBox(
              height: 33,
              child: Row(
                children: [
                  Text(
                    widget.date,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            TransactionCardWidget(
              cardColor: AppColors.graySuperLight,
              leftPadding: 0,
              rightPadding: 0,
              transactionsList: widget.transactionsList,
            )
          ],
        ),
      ),
    );
  }
}
