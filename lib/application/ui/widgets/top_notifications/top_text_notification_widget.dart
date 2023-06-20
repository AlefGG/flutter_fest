import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';

class TopTextNotificationWidget extends StatelessWidget {
  final String text;
  const TopTextNotificationWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Text(
          'Лекция добавлена в программу',
          style: AppTextStyle.snackText.copyWith(
            color: AppColors.darkBackground,
          ),
        ),
      ),
    );
    ;
  }
}
