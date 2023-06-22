// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/resources/resources.dart';

class SessionDetailsScreen extends StatelessWidget {
  const SessionDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: const _AddToFavourite(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _AddToFavouriteConfiguration {
  final String text;
  final String icon;
  final Color iconColor;
  final Color? backgroundColor;
  final LinearGradient? backgroundGradient;

  static const favourite = _AddToFavouriteConfiguration(
    text: "В программе",
    icon: Images.iconsBookmarkFull,
    iconColor: AppColors.green,
    backgroundColor: AppColors.darkSecondary,
    backgroundGradient: null,
  );

  static const disFavourite = _AddToFavouriteConfiguration(
    text: "В мою программу",
    icon: Images.iconsBookmark,
    iconColor: AppColors.white88,
    backgroundColor: null,
    backgroundGradient: LinearGradient(
      colors: <Color>[
        AppColors.green,
        AppColors.blue,
      ],
    ),
  );

  const _AddToFavouriteConfiguration({
    required this.text,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.backgroundGradient,
  });
}

class _AddToFavourite extends StatelessWidget {
  final isFavourite = false;
  const _AddToFavourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configuration = isFavourite
        ? _AddToFavouriteConfiguration.favourite
        : _AddToFavouriteConfiguration.disFavourite;
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
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
                  gradient: configuration.backgroundGradient,
                  color: configuration.backgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12.0))),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      configuration.icon,
                      color: configuration.iconColor,
                    ),
                    const SizedBox(width: 16),
                    Text(configuration.text),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
