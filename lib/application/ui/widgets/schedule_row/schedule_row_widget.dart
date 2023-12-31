import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/navigation/main_navigation.dart';
import 'package:flutter_fest/application/ui/widgets/schedule_row/schedule_row_session_widget.dart';
import 'package:flutter_fest/application/ui/widgets/schedule_row/schedule_row_time_widget.dart';

abstract class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({Key? key}) : super(key: key);

  factory ScheduleRowWidget.single({Key? key}) =>
      _ScheduleRowSingleSessionWidget(key: key);

  factory ScheduleRowWidget.multi({Key? key}) =>
      _ScheduleRowMultiSessionWidget(key: key);
}

class _ScheduleRowSingleSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowSingleSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const progressStatus =
        ScheduleRowWidgetConfigurationProgressStatus.oncoming;
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl:
          'https://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-12/256/man-light-skin-tone.png',
      speakerName: 'Алексей Чулпин',
      sesionTitle: 'Субъективность в оценке дизайна',
      isFavourite: false,
      progressStatus: progressStatus,
    );
    const ddd = ScheduleRowTimeWidgetConfiguration(
      startTime: "8:00",
      endTime: "10:30",
      progressStatus: progressStatus,
    );
    return Stack(
      children: [
        const IntrinsicHeight(
          child: Row(
            children: [
              ScheduleRowTimeWidget(
                configuration: ddd,
              ),
              SizedBox(width: 12),
              Expanded(
                child: ScheduleRowSessionWidget(
                  configuration: configuration,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () =>
                  Navigator.of(context).pushNamed(Screens.sessionDetails),
            ),
          ),
        ),
      ],
    );
  }
}

class _ScheduleRowMultiSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowMultiSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum ScheduleRowWidgetConfigurationProgressStatus {
  oncoming,
  current,
  past,
}
