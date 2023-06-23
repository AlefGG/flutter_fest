import 'package:flutter/material.dart';

import 'package:flutter_fest/application/ui/themes/app_colors.dart';
import 'package:flutter_fest/application/ui/themes/app_text_style.dart';
import 'package:flutter_fest/application/ui/themes/app_theme.dart';
import 'package:flutter_fest/resources/resources.dart';

class SessionDetailsScreen extends StatefulWidget {
  const SessionDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SessionDetailsScreen> createState() => _SessionDetailsScreenState();
}

class _SessionDetailsScreenState extends State<SessionDetailsScreen> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      floatingActionButton: const _AddToFavourite(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: maxSceenWidth),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: EasterEggWidget(
                    scrollController: _scrollController,
                  ),
                ),
                ListView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  controller: _scrollController,
                  padding: EdgeInsets.zero,
                  children: const [
                    _HeaderWidget(),
                    _SessionTitleWidget(),
                    _SessionDescriptionWidget(),
                    _ScheduleInfoWidget(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class EasterEggWidget extends StatefulWidget {
  final ScrollController scrollController;
  const EasterEggWidget({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<EasterEggWidget> createState() => _EasterEggWidgetState();
}

class _EasterEggWidgetState extends State<EasterEggWidget> {
  late ScrollController _scrollController;
  var _easterEggLarge = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = widget.scrollController;
    _scrollController.addListener(_onChangeScrollOffset);
  }

  @override
  void didUpdateWidget(covariant EasterEggWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!identical(oldWidget.scrollController, widget.scrollController)) {
      _scrollController.removeListener(_onChangeScrollOffset);
      _scrollController = widget.scrollController;
      _scrollController.addListener(_onChangeScrollOffset);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _easterEggLarge,
      child: Image.asset(Images.easterEggLarge),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onChangeScrollOffset);
    super.dispose();
  }

  void _onChangeScrollOffset() {
    final offset =
        _scrollController.offset - _scrollController.position.maxScrollExtent;
    if (offset > 0) {
      setState(() {
        _easterEggLarge = offset / 200;
      });
    }
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
    return SizedBox(
      height: 48,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: maxSceenWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
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
                    borderRadius:
                        const BorderRadius.all(Radius.circular(12.0))),
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
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Image.asset(
            Images.speakerBackground,
            fit: BoxFit.fill,
          ),
        ),
        const _SpeakerInfoWidget(),
      ],
    );
  }
}

class _SpeakerInfoWidget extends StatelessWidget {
  const _SpeakerInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 375 / 312,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 124),
                Flexible(
                  flex: 56,
                  child: Text(
                    "Алексей\nЧулпин",
                    style: AppTextStyle.speakerName.copyWith(
                      color: AppColors.white88,
                    ),
                  ),
                ),
                const Spacer(flex: 24),
                Flexible(
                  flex: 40,
                  child: Text(
                    "Ведущий\nразработчик МТС",
                    style: AppTextStyle.bookTextItalic.copyWith(
                      color: AppColors.white88,
                    ),
                  ),
                ),
                const Spacer(flex: 68),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: FractionallySizedBox(
                widthFactor: 208 / 375,
                child: Image.asset(
                  Images.photoMock,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SessionTitleWidget extends StatelessWidget {
  const _SessionTitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 32, right: 20),
      child: Text(
        "Субъективность в оценке дизайна",
        style: AppTextStyle.steinbeckText.copyWith(
          color: AppColors.white88,
        ),
      ),
    );
  }
}

class _SessionDescriptionWidget extends StatelessWidget {
  const _SessionDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 16, right: 20),
      child: Text(
        "Текст описание краткое лекции. Что будет, раскрытие темы. Думаю, что на три или четыре строки. текста нет, так что пишу, что думаю бла бла бла...",
        style: AppTextStyle.bookText.copyWith(
          color: AppColors.white88,
        ),
      ),
    );
  }
}

class _ScheduleInfoWidget extends StatelessWidget {
  const _ScheduleInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 20, top: 24, right: 20),
      child: Row(
        children: [
          _ScheduleInfoElementWidget(
            label: 'Старт',
            text: '8:00',
          ),
          SizedBox(width: 16),
          _ScheduleInfoElementWidget(
            label: 'Секция',
            text: '№1',
          ),
        ],
      ),
    );
  }
}

class _ScheduleInfoElementWidget extends StatelessWidget {
  final String label;
  final String text;
  const _ScheduleInfoElementWidget({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.darkSecondary,
      ),
      child: GradientBorder(
        borderWidth: 2,
        radius: 16,
        gradient: const RadialGradient(
          center: Alignment(0.3, -1.3),
          radius: 1.0,
          colors: [
            Color(0xFF50AF64),
            Color(0xFF3D734D),
            Color(0xFF3D734D),
            Color(0xFF206D82),
          ],
          stops: [
            0.35,
            0.59,
            0.74,
            0.91,
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12,
            top: 10,
            right: 20,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: AppTextStyle.snackText.copyWith(
                  color: AppColors.darkText,
                ),
              ),
              Text(
                text,
                style: AppTextStyle.timeTextBox.copyWith(
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

class GradientBorder extends StatelessWidget {
  final double borderWidth;
  final double radius;
  final Gradient gradient;
  final Widget child;

  const GradientBorder({
    Key? key,
    required this.borderWidth,
    required this.radius,
    required this.gradient,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _GradientPainter(
        borderWidth: borderWidth,
        radius: radius,
        gradient: gradient,
      ),
      child: child,
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double borderWidth;
  final double radius;
  final Gradient gradient;

  _GradientPainter({
    required this.borderWidth,
    required this.radius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final outerRect = Offset.zero & size;
    final outerRRect = RRect.fromRectAndRadius(
      outerRect,
      Radius.circular(radius),
    );

    final innerRect = Rect.fromLTWH(
      borderWidth,
      borderWidth,
      size.width - borderWidth * 2,
      size.height - borderWidth * 2,
    );
    final innerRRect = RRect.fromRectAndRadius(
      innerRect,
      Radius.circular(radius - borderWidth),
    );

    final paint = Paint()..shader = gradient.createShader(outerRect);

    final outerPath = Path()..addRRect(outerRRect);
    final innerPath = Path()..addRRect(innerRRect);
    final path = Path.combine(PathOperation.difference, outerPath, innerPath);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
