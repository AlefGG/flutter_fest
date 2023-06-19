import 'dart:math';

import 'package:flutter/material.dart';
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
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl:
          'https://s3.amazonaws.com/pix.iemoji.com/images/emoji/apple/ios-12/256/man-light-skin-tone.png',
      speakerName: 'Алексей Чулпин',
      sesionTitle: 'Субъективность в оценке дизайна',
      isFavourite: true,
      progressStatus: ScheduleRowWidgetConfigurationProgressStatus.oncoming,
    );
    return SizedBox(
      height: 200,
      child: CustomMultiChildLayout(
        delegate: RowLayoutDelegate(),
        children: [
          LayoutId(
            id: 1,
            child: const ScheduleRowTimeWidget(),
          ),
          LayoutId(
            id: 2,
            child: ScheduleRowSessionWidget(
              configuration: configuration,
            ),
          ),
        ],
      ),
    );
  }
}

class RowLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    const firstChildWidth = 48.0;
    const spaceChildWidth = 12.0;
    const secondChildWidthXOffset = firstChildWidth + spaceChildWidth;

    var secondChildSize = Size.zero;
    if (hasChild(2)) {
      final maxWidth = size.width - secondChildWidthXOffset;
      secondChildSize = layoutChild(
        2,
        BoxConstraints(maxWidth: maxWidth),
      );
    }
    if (hasChild(1)) {
      final maxHeight = max(secondChildSize.height, 90.0);
      layoutChild(
        1,
        BoxConstraints(
          maxWidth: firstChildWidth,
          maxHeight: maxHeight,
        ),
      );
    }
    positionChild(1, Offset.zero);
    positionChild(2, const Offset(secondChildWidthXOffset, 0));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
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
