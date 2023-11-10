import 'package:animations/animations.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scheduler_app/components/page/destination.dart';
import 'package:scheduler_app/components/page/logo.dart';
import 'package:scheduler_app/layout/adaptative.dart';

import 'dart:ui' as ui;
import 'package:scheduler_app/routes.dart';
import 'package:scheduler_app/services/auth_service.dart';

class AppView extends StatelessWidget {
  const AppView({super.key, required this.child, this.currentTab, this.title});

  final Widget child;
  final NavigationTab? currentTab;
  final String? title;

  static AppBar appBar({NavigationTab? currentTab, String? title}) {
    return AppBar(
      title: Text(
        title ??
            (currentTab == null
                ? ''
                : Destination.defaults[currentTab.index].textLabel),
      ),
    );
  }

  static void navigate(int index) {
    final destination = Destination.defaults[index];

    if (destination.type == NavigationTab.logout) {
      Get.find<AuthService>().logOut();
    } else {
      Get.toNamed(destination.type.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isDisplayDesktop(context)) {
      return DesktopView(currentTab: currentTab, title: title, child: child);
    } else {
      return MobileView(currentTab: currentTab, title: title, child: child);
    }
  }
}

class DesktopView extends AppView {
  const DesktopView({
    super.key,
    required super.child,
    super.currentTab,
    super.title,
  });

  static const unselectedColor = Color.fromRGBO(255, 164, 164, 1);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            NavigationRail(
              selectedIndex: currentTab?.index ?? 0,
              backgroundColor: theme.bottomAppBarTheme.color!,
              labelType: NavigationRailLabelType.all,
              leading: const _NavigationRailHeader(),
              onDestinationSelected: AppView.navigate,
              unselectedLabelTextStyle: const TextStyle(color: unselectedColor),
              selectedLabelTextStyle: const TextStyle(color: Colors.white),
              extended: false,
              destinations: [
                for (final destination in Destination.defaults)
                  NavigationRailDestination(
                    icon: Tooltip(
                      message: destination.textLabel,
                      child: RotatedBox(
                        quarterTurns: 4,
                        child: Icon(destination.icon, color: Colors.white),
                      ),
                    ),
                    label: Text(destination.textLabel),
                  ),
              ],
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1300),
                  child: Scaffold(
                    appBar: AppView.appBar(
                      currentTab: currentTab,
                      title: title,
                    ),
                    body: child,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MobileView extends AppView {
  const MobileView({
    super.key,
    required super.child,
    super.currentTab,
    super.title,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppView.appBar(currentTab: currentTab, title: title),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        index: currentTab?.index ?? 0,
        color: theme.bottomAppBarTheme.color!,
        items: [
          for (final destination in Destination.defaults)
            Tooltip(
              message: destination.textLabel,
              child: Icon(destination.icon, color: Colors.white),
            )
        ],
        onTap: AppView.navigate,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1340),
          child: child,
        ),
      ),
    );
  }
}

class _FadeThroughTransitionSwitcher extends StatelessWidget {
  final Widget child;

  final Color fillColor;
  const _FadeThroughTransitionSwitcher({
    required this.fillColor,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          fillColor: fillColor,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: child,
    );
  }
}

// ignore: unused_element
class _NavigationRailHeader extends StatelessWidget {
  const _NavigationRailHeader();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final animation = NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return const Align(
          alignment: AlignmentDirectional.centerStart,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 75,
                child: Logo(),
              ),
              SizedBox(height: 15),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: 8,
                ),
                child: _ReplyFab(extended: false),
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
    );
  }
}

class _ReplyFab extends StatelessWidget {
  final bool extended;

  const _ReplyFab({this.extended = false});

  @override
  Widget build(BuildContext context) {
    const fabSwitcher = _FadeThroughTransitionSwitcher(
      fillColor: Colors.transparent,
      child: Icon(
        Icons.edit_calendar,
        color: Colors.black,
      ),
    );

    const tooltip = 'Schedule Meeting';
    final animation = NavigationRail.extendedAnimation(context);

    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(
        vertical: ui.lerpDouble(0, 6, animation.value)!,
      ),
      child: FloatingActionButton(
        heroTag: 'schedule',
        tooltip: tooltip,
        key: const ValueKey('ScheduleFab'),
        onPressed: onPressed,
        child: fabSwitcher,
      ),
    );
  }

  void onPressed() {
    Get.toNamed(Routes.schedule);
  }
}
