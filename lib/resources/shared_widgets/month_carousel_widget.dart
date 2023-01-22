import 'dart:developer';

import 'package:finance_app/data/models/datetime_model.dart';
import 'package:finance_app/resources/colors.dart';
import 'package:flutter/material.dart';

class MonthCarouselWidget extends StatefulWidget {
  final List<DateTimeModel> monthsList;
  final Function(int month, int year) onSelectMonthYear;
  const MonthCarouselWidget({
    super.key,
    required this.onSelectMonthYear,
    required this.monthsList,
  });

  @override
  State<MonthCarouselWidget> createState() => _MonthCarouselWidgetState();
}

class _MonthCarouselWidgetState extends State<MonthCarouselWidget> {
  int selectedIndex = 0;

  int indexItem = 0;

  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(covariant MonthCarouselWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (indexItem != 0) {
                        indexItem--;
                        selectedIndex = indexItem;
                        widget.onSelectMonthYear(
                          widget.monthsList[indexItem].date?.month ?? 0,
                          widget.monthsList[indexItem].date?.year ?? 0,
                        );
                        scrollController.animateTo(
                            scrollController.offset - 55.0,
                            curve: Curves.linear,
                            duration: const Duration(milliseconds: 300));
                      }
                    });
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                SizedBox(
                  width: 265,
                  height: 20,
                  child: ListView.separated(
                    controller: scrollController,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.monthsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final DateTimeModel monthItem = widget.monthsList[index];
                      log('listMonth ${widget.monthsList}');
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            indexItem = index;
                            widget.onSelectMonthYear(
                              monthItem.date?.month ?? 0,
                              monthItem.date?.year ?? 0,
                            );
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? AppColors.amberPeach
                                : AppColors.transparent,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              monthItem.name,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const Center(child: SizedBox(width: 10));
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (indexItem != widget.monthsList.length - 1) {
                        indexItem++;
                        selectedIndex = indexItem;
                        widget.onSelectMonthYear(
                          widget.monthsList[indexItem].date?.month ?? 0,
                          widget.monthsList[indexItem].date?.year ?? 0,
                        );
                        scrollController.animateTo(
                            scrollController.offset + 55.0,
                            curve: Curves.linear,
                            duration: const Duration(milliseconds: 300));
                      }
                    });
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
