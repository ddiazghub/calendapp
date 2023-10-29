import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scheduler_app/layout/letter_spacing.dart';
import 'package:scheduler_app/components/adaptive_nav.dart';
import 'package:scheduler_app/models/email_model.dart';
import 'package:scheduler_app/colors.dart';
import 'package:scheduler_app/models/email_store.dart';
import 'package:scheduler_app/routes.dart' as routes;
import 'package:google_fonts/google_fonts.dart';
import 'compose_page.dart';

final rootNavKey = GlobalKey<NavigatorState>();

class ReplyApp extends StatefulWidget {
  const ReplyApp({super.key});

  static const String homeRoute = routes.homeRoute;
  static const String composeRoute = routes.composeRoute;

  static Route createComposeRoute(RouteSettings settings) {
    return PageRouteBuilder<void>(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const ComposePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
          fillColor: Theme.of(context).cardColor,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      settings: settings,
    );
  }

  @override
  State<ReplyApp> createState() => _ReplyAppState();
}

class _ReplyAppState extends State<ReplyApp> with RestorationMixin {
  final _RestorableEmailState _appState = _RestorableEmailState();

  @override
  String get restorationId => 'replyState';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_appState, 'state');
  }

  @override
  void dispose() {
    _appState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final replyTheme = _buildReplyDarkTheme(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<EmailStore>.value(
          value: _appState.value,
        ),
      ],
      child: MaterialApp(
        navigatorKey: rootNavKey,
        restorationScopeId: 'appNavigator',
        title: 'Reply',
        debugShowCheckedModeBanner: false,
        theme: replyTheme,
        initialRoute: ReplyApp.homeRoute,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case ReplyApp.homeRoute:
              return MaterialPageRoute<void>(
                builder: (context) => const AdaptiveNav(),
                settings: settings,
              );
            case ReplyApp.composeRoute:
              return ReplyApp.createComposeRoute(settings);
          }
          return null;
        },
      ),
    );
  }
}

class _RestorableEmailState extends RestorableListenable<EmailStore> {
  @override
  EmailStore createDefaultValue() {
    return EmailStore();
  }

  @override
  EmailStore fromPrimitives(Object? data) {
    final appState = EmailStore();
    final appData = Map<String, dynamic>.from(data as Map);
    appState.selectedEmailId = appData['selectedEmailId'] as int;
    appState.onSearchPage = appData['onSearchPage'] as bool;

    // The index of the MailboxPageType enum is restored.
    final mailboxPageIndex = appData['selectedMailboxPage'] as int;
    appState.selectedMailboxPage = MailboxPageType.values[mailboxPageIndex];

    final starredEmailIdsList = appData['starredEmailIds'] as List<dynamic>;
    appState.starredEmailIds = {
      ...starredEmailIdsList.map<int>((dynamic id) => id as int),
    };
    final trashEmailIdsList = appData['trashEmailIds'] as List<dynamic>;
    appState.trashEmailIds = {
      ...trashEmailIdsList.map<int>((dynamic id) => id as int),
    };
    return appState;
  }

  @override
  Object toPrimitives() {
    return <String, dynamic>{
      'selectedEmailId': value.selectedEmailId,
      // The index of the MailboxPageType enum is stored, since the value
      // has to be serializable.
      'selectedMailboxPage': value.selectedMailboxPage.index,
      'onSearchPage': value.onSearchPage,
      'starredEmailIds': value.starredEmailIds.toList(),
      'trashEmailIds': value.trashEmailIds.toList(),
    };
  }
}

ThemeData _buildReplyDarkTheme(BuildContext context) {
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
      selectedLabelTextStyle:
          GoogleFonts.workSansTextTheme().headlineSmall!.copyWith(
                color: AppColors.orange300,
              ),
      unselectedIconTheme: const IconThemeData(color: AppColors.greyLabel),
      unselectedLabelTextStyle:
          GoogleFonts.workSansTextTheme().headlineSmall!.copyWith(
                color: AppColors.greyLabel,
              ),
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
    textTheme: _buildReplyDarkTextTheme(base.textTheme),
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
    labelStyle: GoogleFonts.workSansTextTheme().bodyMedium!.copyWith(
          color: brightness == Brightness.dark
              ? AppColors.white50
              : AppColors.black900,
        ),
    secondaryLabelStyle: GoogleFonts.workSansTextTheme().bodyMedium,
    brightness: brightness,
  );
}

TextTheme _buildReplyDarkTextTheme(TextTheme base) {
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
