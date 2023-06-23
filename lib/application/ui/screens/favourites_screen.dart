import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/application/ui/widgets/schedule_row/schedule_row_widget.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          const _HeaderWidget(),
          const _NotificationControlWidget(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, index) {
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

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 80, right: 20),
        child: RichText(
          text: TextSpan(
            text: 'Моя',
            style: AppTextStyle.steinbeckHeadItalic.copyWith(
              color: AppColors.white88,
            ),
            children: [
              TextSpan(
                text: '\nпрограмма',
                style: AppTextStyle.steinbeckHeadNormal.copyWith(
                  color: AppColors.white88,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationControlWidget extends StatelessWidget {
  const _NotificationControlWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 28,
          right: 20,
        ),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: AppColors.darkSecondary,
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 12,
                    bottom: 12,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Напоминать мне о лекциях\nза 10 минут до начала",
                      style: AppTextStyle.bookText.copyWith(
                        color: AppColors.white88,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  bottom: 16,
                  right: 20,
                ),
                child: Center(
                  child: UniversalCheckbox(
                    value: true,
                    onChanged: (_) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UniversalCheckbox extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;
  const UniversalCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isIOS = Platform.isIOS;

    return isIOS
        ? CupertinoSwitch(
            activeColor: AppColors.green,
            trackColor: AppColors.darkText,
            thumbColor: AppColors.darkSecondary,
            value: value,
            onChanged: (e) {},
          )
        : Switch(
            activeColor: AppColors.white88,
            activeTrackColor: AppColors.green,
            inactiveTrackColor: AppColors.darkText,
            value: value,
            onChanged: (e) {},
          );
  }
}
