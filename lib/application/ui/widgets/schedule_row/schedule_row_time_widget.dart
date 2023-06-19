// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fest/application/ui/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/resources/app_fonts.dart';

class ScheduleRowTimeWidget extends StatelessWidget {
  final ScheduleRowTimeWidgetConfiguration configuration;
  const ScheduleRowTimeWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 12,
      fontFamily: AppFonts.basisGrotesquePro,
      fontWeight: FontWeight.w500,
      height: 1.3,
    );
    return SizedBox(
      width: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                configuration.startTime,
                style: textStyle.copyWith(
                  color: configuration._style.startColor,
                ),
                maxLines: 1,
              ),
              const Spacer(),
              Text(
                configuration.endTime,
                style: textStyle.copyWith(
                  color: configuration._style.endColor,
                ),
                maxLines: 1,
              ),
            ],
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              Expanded(
                child: _DividerWidget(
                  color: configuration._style.startColor,
                  position: _DividerWidgetPosition.top,
                ),
              ),
              Expanded(
                child: _DividerWidget(
                  color: configuration._style.endColor,
                  position: _DividerWidgetPosition.bottom,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

enum _DividerWidgetPosition { top, bottom }

class _DividerWidget extends StatelessWidget {
  final Color color;
  final _DividerWidgetPosition position;

  const _DividerWidget({
    super.key,
    required this.color,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(1.0);
    final borderRadius = position == _DividerWidgetPosition.top
        ? const BorderRadius.only(topLeft: radius, topRight: radius)
        : const BorderRadius.only(bottomLeft: radius, bottomRight: radius);
    return SizedBox(
      width: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Container(),
      ),
    );
  }
}

class _ScheduleRowTimeWidgetConfigurationProgressStyle {
  final Color startColor;
  final Color endColor;
  _ScheduleRowTimeWidgetConfigurationProgressStyle({
    required this.startColor,
    required this.endColor,
  });
}

class ScheduleRowTimeWidgetConfiguration {
  final String startTime;
  final String endTime;
  final ScheduleRowWidgetConfigurationProgressStatus progressStatus;

  _ScheduleRowTimeWidgetConfigurationProgressStyle get _style {
    switch (progressStatus) {
      case ScheduleRowWidgetConfigurationProgressStatus.oncoming:
        return onComingStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.current:
        return inProgressStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
    }
  }

  const ScheduleRowTimeWidgetConfiguration({
    required this.startTime,
    required this.endTime,
    required this.progressStatus,
  });

  static final onComingStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: const Color(0xB7FFFFFF), //Colors.white.withOpacity(0.72),
    endColor: const Color(0xB7FFFFFF),
  );

  static final pastStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: const Color(0xFF52525E), //Colors.white.withOpacity(0.72),
    endColor: const Color(0xFF52525E),
  );

  static final inProgressStyle =
      _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: const Color(0xFF52525E), //Colors.white.withOpacity(0.72),
    endColor: const Color(0xB700BD13),
  );
}
