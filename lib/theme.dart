import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler_app/layout/letter_spacing.dart';
import 'colors.dart';

ThemeData appTheme(BuildContext context) {
  final base = ThemeData.dark();

  return base.copyWith(
    bottomAppBarTheme: const BottomAppBarTheme(
      color: AppColors.darkBottomAppBarBackground,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.darkDrawerBackground,
      modalBackgroundColor: Colors.black.withOpacity(0.7),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: AppColors.darkBottomAppBarBackground,
      selectedIconTheme: const IconThemeData(color: AppColors.orange300),
      selectedLabelTextStyle: GoogleFonts.workSansTextTheme().headlineSmall!.copyWith(color: AppColors.orange300),
      unselectedIconTheme: const IconThemeData(color: AppColors.greyLabel),
      unselectedLabelTextStyle: GoogleFonts.workSansTextTheme().headlineSmall!.copyWith(color: AppColors.greyLabel),
    ),
    canvasColor: AppColors.black900,
    cardColor: AppColors.darkCardBackground,
    chipTheme: _buildChipTheme(
      AppColors.blue200,
      AppColors.darkChipBackground,
      Brightness.dark,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.blue200,
      primaryContainer: AppColors.blue300,
      secondary: AppColors.orange300,
      secondaryContainer: AppColors.orange300,
      surface: AppColors.black800,
      error: AppColors.red200,
      onPrimary: AppColors.black900,
      onSecondary: AppColors.black900,
      onBackground: AppColors.white50,
      onSurface: AppColors.white50,
      onError: AppColors.black900,
      background: AppColors.black900Alpha087,
    ),
    textTheme: _buildDarkTextTheme(base.textTheme),
    scaffoldBackgroundColor: AppColors.black900,
  );
}

ChipThemeData _buildChipTheme(
  Color primaryColor,
  Color chipBackground,
  Brightness brightness,
) {
  return ChipThemeData(
    backgroundColor: primaryColor.withOpacity(0.12),
    disabledColor: primaryColor.withOpacity(0.87),
    selectedColor: primaryColor.withOpacity(0.05),
    secondarySelectedColor: chipBackground,
    padding: const EdgeInsets.all(4),
    shape: const StadiumBorder(),
    labelStyle: GoogleFonts.workSansTextTheme()
        .bodyMedium!
        .copyWith(color: brightness == Brightness.dark ? AppColors.white50 : AppColors.black900),
    secondaryLabelStyle: GoogleFonts.workSansTextTheme().bodyMedium,
    brightness: brightness,
  );
}

TextTheme _buildDarkTextTheme(TextTheme base) {
  return base.copyWith(
    headlineMedium: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      letterSpacing: letterSpacingOrNone(0.4),
      height: 0.9,
      color: AppColors.white50,
    ),
    headlineSmall: GoogleFonts.workSans(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: letterSpacingOrNone(0.27),
      color: AppColors.white50,
    ),
    titleLarge: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: letterSpacingOrNone(0.18),
      color: AppColors.white50,
    ),
    titleSmall: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: letterSpacingOrNone(-0.04),
      color: AppColors.white50,
    ),
    bodyLarge: GoogleFonts.workSans(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      letterSpacing: letterSpacingOrNone(0.2),
      color: AppColors.white50,
    ),
    bodyMedium: GoogleFonts.workSans(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: letterSpacingOrNone(-0.05),
      color: AppColors.white50,
    ),
    bodySmall: GoogleFonts.workSans(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      letterSpacing: letterSpacingOrNone(0.2),
      color: AppColors.white50,
    ),
  );
}
