import 'package:flutter/material.dart';
import 'package:paynav_for_all/resources/resources.dart' as resources;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangePicker extends StatefulWidget {
  const DateRangePicker({Key? key}) : super(key: key);

  @override
  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return SfDateRangePickerTheme(
      data: SfDateRangePickerThemeData(
        brightness: Brightness.light,
        selectionColor: resources.yellowColor,
        backgroundColor: resources.darkBlue,
        startRangeSelectionColor: resources.yellowColor,
        endRangeSelectionColor: resources.yellowColor,
        headerTextStyle: const TextStyle(color: resources.whiteColor),
        activeDatesTextStyle: const TextStyle(color: resources.whiteColor),
        viewHeaderTextStyle: const TextStyle(color: resources.whiteColor)
      ),
      child: SfDateRangePicker(
        controller: _controller,
        headerStyle: const DateRangePickerHeaderStyle(
          textAlign: TextAlign.center,
        ),
        view: DateRangePickerView.month,
        showTodayButton: true,
        monthCellStyle: const DateRangePickerMonthCellStyle(),
        rangeSelectionColor: resources.lightBlueColor,
        selectionColor: resources.yellowColor,
        selectionMode: DateRangePickerSelectionMode.range,
        onSelectionChanged: (value) {},
      ),
    );
  }
}
