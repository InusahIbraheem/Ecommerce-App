import 'package:flutter/material.dart';

enum ScreenSize { mobile, tablet, desktop }

class ResponsiveUtils {
  ResponsiveUtils._();

  static ScreenSize screenSizeOf(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width >= 1200) return ScreenSize.desktop;
    if (width >= 768) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }

  static bool isMobile(BuildContext context) =>
      screenSizeOf(context) == ScreenSize.mobile;

  static bool isTablet(BuildContext context) =>
      screenSizeOf(context) == ScreenSize.tablet;

  static bool isDesktop(BuildContext context) =>
      screenSizeOf(context) == ScreenSize.desktop;

  static double horizontalPadding(BuildContext context) {
    return switch (screenSizeOf(context)) {
      ScreenSize.desktop => 48,
      ScreenSize.tablet => 32,
      ScreenSize.mobile => 16,
    };
  }

  static int gridCrossAxisCount(BuildContext context) {
    return switch (screenSizeOf(context)) {
      ScreenSize.desktop => 4,
      ScreenSize.tablet => 3,
      ScreenSize.mobile => 2,
    };
  }

  static double maxContentWidth(BuildContext context) {
    return switch (screenSizeOf(context)) {
      ScreenSize.desktop => 1200,
      ScreenSize.tablet => 900,
      ScreenSize.mobile => double.infinity,
    };
  }
}
