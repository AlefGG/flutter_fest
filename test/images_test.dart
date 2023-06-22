import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_fest/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.eft).existsSync(), isTrue);
    expect(File(Images.iconsBookmark).existsSync(), isTrue);
    expect(File(Images.iconsBookmarkFull).existsSync(), isTrue);
    expect(File(Images.iconsCalendar).existsSync(), isTrue);
    expect(File(Images.iconsCalendarFull).existsSync(), isTrue);
    expect(File(Images.iconsPoint).existsSync(), isTrue);
    expect(File(Images.iconsPointFull).existsSync(), isTrue);
    expect(File(Images.iconsRoutes).existsSync(), isTrue);
    expect(File(Images.iconsStar).existsSync(), isTrue);
    expect(File(Images.iconsStarFull).existsSync(), isTrue);
    expect(File(Images.photoMock).existsSync(), isTrue);
    expect(File(Images.scheduleFfLogo).existsSync(), isTrue);
    expect(File(Images.scheduleBg).existsSync(), isTrue);
    expect(File(Images.scheduleLogo).existsSync(), isTrue);
    expect(File(Images.scheduleSurfLogo).existsSync(), isTrue);
    expect(File(Images.speakerBackground).existsSync(), isTrue);
    expect(File(Images.tabbarBookmark).existsSync(), isTrue);
    expect(File(Images.tabbarCalendar).existsSync(), isTrue);
    expect(File(Images.tabbarPoint).existsSync(), isTrue);
  });
}
