import 'package:fluent_ui/fluent_ui.dart';
import 'package:help_me_ui/config/screen.dart';
import 'package:help_me_ui/pages/other/icp_record.dart';
import 'package:help_me_ui/pages/other/top_navigation_bar.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart' as origin;

class ScreenLimit extends StatelessWidget {
  ScreenLimit(
      {super.key,
      required this.child,
      this.floatWidgets = const [],
      this.showTopNavigationBar = true});

  final Widget child;
  final List<Widget> floatWidgets;
  final bool showTopNavigationBar;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: LayoutBuilder(
        builder: (context, constrains) {
          bool isMobile = context.watch<ScreenModel>().isMobile;
          //todo 为避免构建期间更新，更新操作放在下一帧执行
          // WidgetsBinding.instance.addPostFrameCallback((_) {
          //
          // });
          Widget scrollWidget = SingleChildScrollView(
            controller: _scrollController,
            // padding: const EdgeInsets.only(right: 22),
            child: Column(
              children: [
                if (showTopNavigationBar) const TopNavigationBar(),
                Container(
                  height: 2000,
                  color: const Color(0xfff0f2f5),
                  child: Center(child: child),
                ),
                const ICPRecord()
              ],
            ),
          );
          if (isMobile) {
            scrollWidget = origin.Scrollbar(
              child: scrollWidget,
            );
          }
          return Stack(
            children: [
              scrollWidget,
              ...floatWidgets //应该吧浮动组件放到后面，这样他的层级就会高一点,就会覆盖在之前的组件上了
            ],
          );
        },
      ),
    );
  }
}
