import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fest/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.eft).existsSync(), true);
    expect(File(Images.iconsBookmark).existsSync(), true);
    expect(File(Images.iconsBookmarkFull).existsSync(), true);
    expect(File(Images.iconsCalendar).existsSync(), true);
    expect(File(Images.iconsCalendarFull).existsSync(), true);
    expect(File(Images.iconsPoint).existsSync(), true);
    expect(File(Images.iconsPointFull).existsSync(), true);
    expect(File(Images.iconsRoutes).existsSync(), true);
    expect(File(Images.iconsStar).existsSync(), true);
    expect(File(Images.iconsStarFull).existsSync(), true);
    expect(File(Images.scheduleFfLogo).existsSync(), true);
    expect(File(Images.scheduleBg).existsSync(), true);
    expect(File(Images.scheduleLogo).existsSync(), true);
    expect(File(Images.scheduleSurfLogo).existsSync(), true);
    expect(File(Images.tabbarBookmark).existsSync(), true);
    expect(File(Images.tabbarCalendar).existsSync(), true);
    expect(File(Images.tabbarPoint).existsSync(), true);
  });
}
