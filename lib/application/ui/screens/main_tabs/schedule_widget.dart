import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/application/ui/widgets/schedule_row/schedule_row_break_widget.dart';
import 'package:flutter_fest/application/ui/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/application/ui/widgets/top_notifications/top_notification_overlay_widget.dart';
import 'package:flutter_fest/application/ui/widgets/top_notifications/top_text_notification_widget.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  OverlayEntry? _lectureOverlay;

  void showOverlay(BuildContext context) {
    final overlay = _lectureOverlay;
    if (overlay != null) {
      overlay.remove();
      _lectureOverlay = null;
      return;
    }
    const textWidget = TopTextNotificationWidget(
      text: 'Лекция добавлена в программу',
    );
    final entry = TopNotificationOverlayWidget.makeOverlayEntry(textWidget);
    _lectureOverlay = entry;
    Overlay.of(context).insert(entry);
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          const _LogoWidget(),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(topInset: topInset),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(
              child: const Text('button'),
              onPressed: () {
                showOverlay(context);
              },
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) {
                if (index == 2) {
                  return const Padding(
                    padding: EdgeInsets.only(
                      top: 16,
                      left: 14,
                      right: 14,
                    ),
                    child: SizedBox(
                      height: 70,
                      child: ScheduleRowBreakWidget(),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 20,
                    right: 20,
                  ),
                  child: ScheduleRowWidget.single(),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 228,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Image.asset(Images.scheduleBg),
            ),
            Positioned(
              left: 20,
              top: 84,
              bottom: 0,
              child: Image.asset(Images.scheduleFfLogo),
            ),
            Positioned(
                right: 20,
                top: 64,
                child: Image.asset(Images.scheduleSurfLogo)),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double _height = 56;
  final double topInset;

  _SliverAppBarDelegate({required this.topInset});

  @override
  double get minExtent => _height + topInset;
  @override
  double get maxExtent => _height + topInset;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _SectionButtonsWidget(topInset: topInset);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SectionButtonsWidget extends StatelessWidget {
  final double topInset;

  const _SectionButtonsWidget({Key? key, required this.topInset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const totalItem = 5;
    const itemGradientWidth = 2.0;
    const halfItemGradientWidth = itemGradientWidth / 2;
    const endGradientPoint =
        totalItem * itemGradientWidth + halfItemGradientWidth;

    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 20, right: 20, top: topInset),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          final currentGradientStartPoint =
              (halfItemGradientWidth + index * itemGradientWidth);
          final currentGradientEndPoint =
              endGradientPoint - currentGradientStartPoint;

          return Center(
            child: SizedBox(
              height: 36,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(AppColors.white),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.zero,
                  ),
                  elevation: MaterialStateProperty.all(0.0),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(-currentGradientStartPoint, 0.0),
                        end: Alignment(currentGradientEndPoint, 0.0),
                        colors: const <Color>[
                          AppColors.green,
                          AppColors.blue,
                        ],
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(80.0))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('Секция $index'),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}
