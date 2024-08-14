import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/utils/utils.dart';

class AppScrollBehavior extends ScrollBehavior {
  const AppScrollBehavior();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics();
}

class NoTransitionsOnWeb extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    if (Utils.isWeb) {
      return child;
    }
    return super.buildTransitions(
      route,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}

/// Note: Not to use any color or font outside of this class
/// if required add it inside this class and then used it.
class AppTheme {
  const AppTheme._();

  //Fonts
  static const fontRoboto = 'Roboto';

  //Colors
  static const primaryColor = Color(0xFF405CE7);
  static const secondaryColor = Color(0xFFEF0035);
  static const redColor = Color(0xFFD31313);
  static const yellowColor = Color(0xFFFEFD03);
  static const greenColor = Color(0xFF037E0B);
  static const charcoalColor = Color(0xFF333333);
  static const grayColor = Color(0xFF9E9E9E);
  static const darkGreyColor = Color(0xFF616161);
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const transparentColor = Color(0x00000000);

  static const borderRadius = BorderRadius.all(Radius.circular(8));

  // Opacity
  static const opacityEnabled = 1.0;
  static const opacityDisabled = 0.4;

  static const systemOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: transparentColor,
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.light, // For iOS (dark icons)
  );

  static final darkTheme = ThemeData(
    useMaterial3: false,
    pageTransitionsTheme: NoTransitionsOnWeb(),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: blackColor,
    cardColor: charcoalColor,
    cardTheme: const CardTheme(
      color: charcoalColor,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: grayColor),
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor).copyWith(
      surface: blackColor,
      brightness: Brightness.dark,
    ),
    fontFamily: fontRoboto,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: systemOverlayStyle,
      elevation: 4,
      color: primaryColor,
      titleTextStyle: TextStyle(color: whiteColor),
      iconTheme: IconThemeData(color: whiteColor),
    ),
    dividerColor: grayColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 0,
        backgroundColor: blackColor,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 0,
        foregroundColor: blackColor,
        textStyle: const TextStyle(fontSize: 20),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          foregroundColor: AppTheme.primaryColor,
          elevation: 2,
          disabledBackgroundColor: AppTheme.grayColor.withOpacity(AppTheme.opacityDisabled),
          shape: const RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(color: whiteColor),
          ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        side: const BorderSide(
          width: 1.0,
          color: whiteColor,
          style: BorderStyle.solid,
        ),
        backgroundColor: AppTheme.transparentColor,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: whiteColor,
        fontWeight: FontWeight.w300,
      ),
      displayMedium: TextStyle(
        color: whiteColor,
      ),
      displaySmall: TextStyle(
        color: whiteColor,
      ),
      headlineMedium: TextStyle(
        color: whiteColor,
      ),
      headlineSmall: TextStyle(
        color: whiteColor,
      ),
      titleLarge: TextStyle(
        color: whiteColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: whiteColor,
      ),
      titleSmall: TextStyle(
        color: whiteColor,
      ),
      bodyLarge: TextStyle(
        color: whiteColor,
      ),
      bodyMedium: TextStyle(
        color: whiteColor,
      ),
      labelLarge: TextStyle(
        color: whiteColor,
      ),
      bodySmall: TextStyle(
        color: whiteColor,
      ),
      labelSmall: TextStyle(
        color: whiteColor,
      ),
    ),
  );
}

extension ThemeExtension on BuildContext {
  //Text
  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle get displayLarge => textTheme.displayLarge!;
  TextStyle get displayMedium => textTheme.displayMedium!;
  TextStyle get displaySmall => textTheme.displaySmall!;

  TextStyle get headlineSmall => textTheme.headlineSmall!;
  TextStyle get headlineMedium => textTheme.headlineMedium!;
  TextStyle get headlineLarge => textTheme.headlineLarge!;

  TextStyle get bodyLarge => textTheme.bodyLarge!;
  TextStyle get bodyMedium => textTheme.bodyMedium!;
  TextStyle get bodySmall => textTheme.bodySmall!;

  TextStyle get labelLarge => textTheme.labelLarge!;
  TextStyle get labelMedium => textTheme.labelMedium!;
  TextStyle get labelSmall => textTheme.labelSmall!;

  TextStyle get titleLarge => textTheme.titleLarge!;
  TextStyle get titleMedium => textTheme.titleMedium!;
  TextStyle get titleSmall => textTheme.titleSmall!;

  //Color
  Color get primaryColor => AppTheme.primaryColor;
  Color get secondaryColor => AppTheme.secondaryColor;
  Color get redColor => AppTheme.redColor;
  Color get greenColor => AppTheme.greenColor;
  Color get charcoalColor => AppTheme.charcoalColor;
  Color get grayColor => AppTheme.grayColor;
  Color get darkGreyColor => AppTheme.darkGreyColor;
  Color get whiteColor => AppTheme.whiteColor;
  Color get blackColor => AppTheme.blackColor;
  Color get transparent => AppTheme.transparentColor;

  // Opacity
  double get opacityEnabled => AppTheme.opacityEnabled;
  double get opacityDisabled => AppTheme.opacityDisabled;
}
