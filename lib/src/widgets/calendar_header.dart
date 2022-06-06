// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../customization/header_style.dart';
import '../shared/utils.dart' show CalendarFormat, DayBuilder;
import 'custom_icon_button.dart';
import 'format_button.dart';

class CalendarHeader extends StatelessWidget {
  final dynamic locale;
  final DateTime focusedMonth;
  final CalendarFormat calendarFormat;
  final HeaderStyle headerStyle;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onLeftChevronTapYear;
  final VoidCallback onRightChevronTapYear;
  final VoidCallback onHeaderTap;
  final VoidCallback onHeaderLongPress;
  final ValueChanged<CalendarFormat> onFormatButtonTap;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final DayBuilder? headerTitleBuilder;
  final Widget leftIcon;
  final Widget rightIcon;

  const CalendarHeader({
    Key? key,
    this.locale,
    required this.focusedMonth,
    required this.calendarFormat,
    required this.headerStyle,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    required this.onLeftChevronTapYear,
    required this.onRightChevronTapYear,
    required this.onHeaderTap,
    required this.onHeaderLongPress,
    required this.onFormatButtonTap,
    required this.availableCalendarFormats,
    this.headerTitleBuilder,
    required this.leftIcon,
    required this.rightIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = headerStyle.titleTextFormatter?.call(focusedMonth, locale) ??
        DateFormat.MMMM(locale).format(focusedMonth);
    final year = headerStyle.titleTextFormatter?.call(focusedMonth, locale) ??
        DateFormat.y(locale).format(focusedMonth);

    return Container(
      decoration: headerStyle.decoration,
      margin: headerStyle.headerMargin,
      padding: headerStyle.headerPadding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomIconButton(
                icon: leftIcon,
                onTap: onLeftChevronTap,
                margin: headerStyle.leftChevronMargin,
                padding: headerStyle.leftChevronPadding,
              ),
              Text(
                text,
                style: headerStyle.titleTextStyle,
                textAlign: headerStyle.titleCentered
                    ? TextAlign.center
                    : TextAlign.start,
              ),
              CustomIconButton(
                icon: rightIcon,
                onTap: onRightChevronTap,
                margin: headerStyle.rightChevronMargin,
                padding: headerStyle.rightChevronPadding,
              ),
            ],
          ),
          Row(
            children: [
              CustomIconButton(
                icon: leftIcon,
                onTap: onLeftChevronTapYear,
                margin: headerStyle.leftChevronMargin,
                padding: headerStyle.leftChevronPadding,
              ),
              Text(
                year,
                style: headerStyle.titleTextStyle,
                textAlign: headerStyle.titleCentered
                    ? TextAlign.center
                    : TextAlign.start,
              ),
              CustomIconButton(
                icon: rightIcon,
                onTap: onRightChevronTapYear,
                margin: headerStyle.rightChevronMargin,
                padding: headerStyle.rightChevronPadding,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
