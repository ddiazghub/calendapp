import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scheduler_app/layout/letter_spacing.dart';
import 'colors.dart';

ThemeData appTheme(BuildContext context) {
  final base = ThemeData.light();

  return base.copyWith(
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color.fromARGB(255, 255, 3, 3),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.darkDrawerBackground,
      modalBackgroundColor:
          const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
    ),
    navigationRailTheme: NavigationRailThemeData(
      backgroundColor: const Color.fromARGB(255, 255, 3, 3),
      selectedIconTheme:
          const IconThemeData(color: Color.fromARGB(255, 12, 12, 12)),
      selectedLabelTextStyle: GoogleFonts.workSansTextTheme()
          .headlineSmall!
          .copyWith(color: const Color.fromARGB(255, 0, 0, 0)),
      unselectedIconTheme:
          const IconThemeData(color: Color.fromARGB(255, 10, 10, 10)),
      unselectedLabelTextStyle: GoogleFonts.workSansTextTheme()
          .headlineSmall!
          .copyWith(color: const Color.fromARGB(255, 7, 4, 4)),
    ),
    canvasColor: const Color.fromARGB(255, 14, 13, 13),
    cardColor: AppColors.darkCardBackground,
    chipTheme: _buildChipTheme(
      const Color.fromARGB(255, 0, 6, 8),
      AppColors.darkChipBackground,
      Brightness.light,
    ),
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 255, 3, 3),
      secondary: Color.fromARGB(255, 255, 255, 255),
      secondaryContainer: AppColors.orange300,
      error: AppColors.red200,
      onPrimary: AppColors.black900,
      onSecondary: AppColors.black900,
      onBackground: Color.fromARGB(255, 248, 248, 248),
      onSurface: Color.fromARGB(255, 0, 0, 0), //no cambiar
      onError: AppColors.black900,
      background: Color.fromARGB(222, 247, 206, 206),
    ),
    textTheme: _buildDarkTextTheme(base.textTheme),
    scaffoldBackgroundColor: const Color.fromARGB(
      248,
      255,
      255,
      255,
    ), //no cambiar
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
    labelStyle: GoogleFonts.workSansTextTheme().bodyMedium!.copyWith(
        color: brightness == Brightness.dark
            ? const Color.fromARGB(255, 7, 7, 7)
            : AppColors.black900),
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
      color: const Color.fromARGB(255, 20, 20, 20),
    ),
    headlineSmall: GoogleFonts.workSans(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: letterSpacingOrNone(0.27),
      color: const Color.fromARGB(255, 24, 22, 22),
    ),
    titleLarge: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      letterSpacing: letterSpacingOrNone(0.18),
      color: const Color.fromARGB(255, 12, 11, 11),
    ),
    titleSmall: GoogleFonts.workSans(
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: letterSpacingOrNone(-0.04),
      color: const Color.fromARGB(255, 7, 7, 7),
    ),
    bodyLarge: GoogleFonts.workSans(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      letterSpacing: letterSpacingOrNone(0.2),
      color: const Color.fromARGB(255, 15, 15, 15),
    ),
    bodyMedium: GoogleFonts.workSans(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: letterSpacingOrNone(-0.05),
      color: const Color.fromARGB(255, 15, 15, 15),
    ),
    bodySmall: GoogleFonts.workSans(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      letterSpacing: letterSpacingOrNone(0.2),
      color: const Color.fromARGB(255, 14, 13, 13),
    ),
  );
}
