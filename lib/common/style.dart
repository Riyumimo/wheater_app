import 'package:wheater_app/common_libs.dart';

import 'app_color.dart';

class AppStyle {
  late final Text text = Text();

  /// The current theme colors for the app
  final AppColors colors = AppColors();
}

class Text {
  final Map<String, TextStyle> _titleFonts = {
    'en': const TextStyle(fontFamily: 'Inter'),
  };

  final Map<String, TextStyle> _contentFonts = {
    'en': const TextStyle(
      fontFamily: 'Inter',
    )
  };

  TextStyle _getFontForLocale(Map<String, TextStyle> fonts) {
    // if (localeLogic.isLoaded) {
    //   return fonts.entries
    //       .firstWhere((x) => x.key == $strings.localeName,
    //           orElse: () => fonts.entries.first)
    //       .value;
    // } else {
    return fonts.entries.first.value;
    // }
  }

  TextStyle get titleFont => _getFontForLocale(_titleFonts);
  TextStyle get contentFont => _getFontForLocale(_contentFonts);

  late final TextStyle header1 =
      _createFont(titleFont, sizePx: 43, heightPx: 52, weight: FontWeight.w700);
  late final TextStyle title1 = _createFont(titleFont,
      sizePx: 20, heightPx: 48, spacingPc: 5, weight: FontWeight.w500);
  late final TextStyle title2 =
      _createFont(titleFont, sizePx: 14, heightPx: 17, weight: FontWeight.w400);

  late final TextStyle body = _createFont(contentFont, sizePx: 9, heightPx: 11);
  late final TextStyle bodyBold = _createFont(contentFont,
      sizePx: 9, heightPx: 11, weight: FontWeight.w400);
  late final TextStyle bodySmall =
      _createFont(contentFont, sizePx: 7, heightPx: 8);
  late final TextStyle bodySmallBold =
      _createFont(contentFont, sizePx: 7, heightPx: 8, weight: FontWeight.w400);

  TextStyle _createFont(TextStyle style,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight}) {
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : style.height,
        letterSpacing:
            spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
        fontWeight: weight);
  }
}
