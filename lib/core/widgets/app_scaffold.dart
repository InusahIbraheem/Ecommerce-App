import 'package:flutter/material.dart';

import '../utils/responsive_utils.dart';
import 'app_footer.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.showFooter = true,
    this.padding,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool showFooter;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final horizontal = ResponsiveUtils.horizontalPadding(context);
    final maxWidth = ResponsiveUtils.maxContentWidth(context);

    return Scaffold(
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: padding ??
                    EdgeInsets.symmetric(horizontal: horizontal, vertical: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: body,
                  ),
                ),
              ),
            ),
            if (showFooter) const AppFooter(),
          ],
        ),
      ),
    );
  }
}
