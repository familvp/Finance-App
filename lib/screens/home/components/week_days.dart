import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;

import '../blocs/weekDatesBloc/weekdate_bloc.dart';

class WeekDays extends StatelessWidget {
  const WeekDays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget greenCricle = Container(
      height: 5,
      width: 5,
      margin: EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),
    );

    final Widget redCircle = Container(
      height: 5,
      width: 5,
      margin: EdgeInsets.only(top: 2, left: 5, right: 5),
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );

    return BlocBuilder<WeekdateBloc, WeekdateState>(
      builder: (context, state) {
        if (state is WeekdateSelected) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  BlocProvider.of<WeekdateBloc>(context).weekDates.map((date) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        resources.weekDayInitials[
                            date.weekday == 7 ? 0 : date.weekday],
                        style: TextStyle(
                          color: date.day == state.selectedDate.day
                              ? resources.whiteBlueColor
                              : resources.whiteBlue50Color,
                          fontSize: 12,
                          height: 16 / 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    date.day == state.selectedDate.day
                        ? Container(
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.only(
                                top: 10, left: 6, right: 6, bottom: 15),
                            child: Column(
                              children: [
                                Text(
                                  '${date.day}',
                                  style: const TextStyle(
                                    color: resources.whiteBlueColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    height: 16 / 14,
                                  ),
                                ),
                                greenCricle,
                                redCircle,
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: resources.lightBlueColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          )
                        : InkWell(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15, left: 6, right: 6),
                              child: Column(
                                children: [
                                  Text(
                                    '${date.day}',
                                    style: const TextStyle(
                                      color: resources.whiteBlueColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      height: 16 / 14,
                                    ),
                                  ),
                                  greenCricle,
                                  redCircle,
                                ],
                              ),
                            ),
                            onTap: () {
                              BlocProvider.of<WeekdateBloc>(context)
                                  .add(ChangeSelectedDate(date));
                            },
                          ),
                  ],
                );
              }).toList(),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
