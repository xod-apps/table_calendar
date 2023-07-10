// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TodayButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final TextStyle textStyle;
  final BoxDecoration decoration;
  final EdgeInsets padding;
  final CalendarFormat calendarFormat;

  const TodayButton({
    Key? key,
    required this.onTap,
    required this.textStyle,
    required this.decoration,
    required this.padding,
    required this.text,
    required this.calendarFormat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Container(
      decoration: decoration,
      padding: padding,
      child: Text(
        _TodayButtonText,
        style: textStyle,
      ),
    );

    final platform = Theme.of(context).platform;

    return !kIsWeb &&
            (platform == TargetPlatform.iOS || platform == TargetPlatform.macOS)
        ? CupertinoButton(
            onPressed: () => onTap.call(),
            padding: EdgeInsets.zero,
            child: child,
          )
        : InkWell(
            borderRadius:
                decoration.borderRadius?.resolve(Directionality.of(context)),
            onTap: () => onTap.call(),
            child: child,
          );
  }

  String get _TodayButtonText => text;
}
