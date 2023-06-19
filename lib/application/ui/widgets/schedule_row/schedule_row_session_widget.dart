// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/widgets/schedule_row/schedule_row_widget.dart';

import 'package:flutter_fest/resources/app_fonts.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleRowSessionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;
  const ScheduleRowSessionWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: configuration._style.widgetBackground,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.only(left: 16, top: 4, right: 4, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _SpeakerWidget(
                  configuration: configuration,
                ),
              ),
              _FavouriteWidget(
                configuration: configuration,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _DescriptionWidget(
              configuration: configuration,
            ),
          ),
        ],
      ),
    );
  }
}

class _SpeakerWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _SpeakerWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const avatarSize = 24;
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(avatarSize / 2),
          child: Image.network(
            configuration.avatarUrl,
            height: avatarSize.toDouble(),
            width: avatarSize.toDouble(),
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            configuration.speakerName,
            style: TextStyle(
              color: configuration._style.speakerNameColor,
              fontSize: 14,
              fontFamily: AppFonts.basisGrotesquePro,
              fontWeight: FontWeight.w500,
              height: 1.4285714286,
            ),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _FavouriteWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _FavouriteWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onPressed: () {},
      icon: Image.asset(
        configuration._favouriteStyle.favouriteButtonIcon,
        color: configuration._favouriteStyle.favouriteButtonColor,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  final ScheduleRowSessionWidgetConfiguration configuration;

  const _DescriptionWidget({
    Key? key,
    required this.configuration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      configuration.sesionTitle,
      style: TextStyle(
        color: configuration._style.sessionTitleColor,
        fontSize: 18,
        fontFamily: AppFonts.steinbeck,
        height: 1.222222,
      ),
    );
  }
}

class _ScheduleRowSessionWidgetConfigurationProgressStyle {
  final Color widgetBackground;
  final Color speakerNameColor;
  final Color sessionTitleColor;

  const _ScheduleRowSessionWidgetConfigurationProgressStyle({
    required this.widgetBackground,
    required this.speakerNameColor,
    required this.sessionTitleColor,
  });
}

class _ScheduleRowSessionWidgetConfigurationFavouriteStyle {
  final Color? favouriteButtonColor;
  final Color? widgetBackgroundGradient;
  final String favouriteButtonIcon;

  const _ScheduleRowSessionWidgetConfigurationFavouriteStyle({
    required this.favouriteButtonColor,
    required this.widgetBackgroundGradient,
    required this.favouriteButtonIcon,
  });
}

class ScheduleRowSessionWidgetConfiguration {
  final String avatarUrl;
  final String speakerName;
  final String sesionTitle;
  final bool isFavourite;
  final ScheduleRowWidgetConfigurationProgressStatus progressStatus;

  _ScheduleRowSessionWidgetConfigurationProgressStyle get _style {
    switch (progressStatus) {
      case ScheduleRowWidgetConfigurationProgressStatus.oncoming:
      case ScheduleRowWidgetConfigurationProgressStatus.current:
        return onComingStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
    }
  }

  _ScheduleRowSessionWidgetConfigurationFavouriteStyle get _favouriteStyle =>
      isFavourite ? isFavouriteStyle : isNotFavouriteStyle;

  const ScheduleRowSessionWidgetConfiguration({
    required this.avatarUrl,
    required this.speakerName,
    required this.sesionTitle,
    required this.isFavourite,
    required this.progressStatus,
  });

  static const onComingStyle =
      _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackground: Color(0xFF101115),
    speakerNameColor: Color(0xFF52525e),
    sessionTitleColor: Colors.white,
  );
  static const pastStyle = _ScheduleRowSessionWidgetConfigurationProgressStyle(
    widgetBackground: Colors.transparent,
    speakerNameColor: Color(0x7A52525e),
    sessionTitleColor: Color(0xFF52525e),
  );

  static const isFavouriteStyle =
      _ScheduleRowSessionWidgetConfigurationFavouriteStyle(
    favouriteButtonColor: Color(0xFF00BD13),
    widgetBackgroundGradient: Color(0xFF00BD13),
    favouriteButtonIcon: Images.iconsBookmarkFull,
  );

  static const isNotFavouriteStyle =
      _ScheduleRowSessionWidgetConfigurationFavouriteStyle(
    favouriteButtonColor: null,
    widgetBackgroundGradient: null,
    favouriteButtonIcon: Images.iconsBookmark,
  );
}
