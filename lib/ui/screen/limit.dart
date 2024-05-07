import 'package:fluent_ui/fluent_ui.dart';
import 'package:help_me_ui/config/screen.dart';
import 'package:help_me_ui/pages/other/icp_record.dart';
import 'package:help_me_ui/pages/other/top_navigation_bar.dart';
import 'package:provider/provider.dart';

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
          // if (context.) {
          //   context
          //       .read<ScreenModel>()
          //       .dimension(constrains.maxWidth, constrains.maxHeight);
          // }
          return Stack(
            children: [
              SingleChildScrollView(
                controller: _scrollController,
// padding: const EdgeInsets.only(right: 22),
                child: Column(
                  children: [
                    if (showTopNavigationBar) const TopNavigationBar(),
                    Container(
                      height: 1000,
                      color: const Color(0xfff0f2f5),
                      child: Center(child: child),
                    ),
                    const ICPRecord()
                  ],
                ),
              ),
              ...floatWidgets //应该吧浮动组件放到后面，这样他的层级就会高一点,就会覆盖在之前的组件上了
            ],
          );
        },
      ),
    );
  }
}

class Outer extends StatelessWidget {
  const Outer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      content: LayoutBuilder(
        builder: (context, constrains) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            context.read<ScreenModel>().dimension(constrains.maxWidth, constrains.maxHeight);
          });

          debugPrint('${constrains.maxHeight}');
          return Inner(
              child: child,
              maxWidth: constrains.maxWidth,
              maxHeight: constrains.maxHeight);
        },
      ),
    );
  }
}

class Inner extends StatefulWidget {
  const Inner(
      {super.key,
      required this.child,
      required this.maxWidth,
      required this.maxHeight});

  final double maxWidth;
  final double maxHeight;
  final Widget child;

  @override
  State<Inner> createState() => _InnerState();
}

class _InnerState extends State<Inner> {
  @override
  void initState() {
    // if(context.mounted){
    //   context.read<ScreenModel>().dimension(widget.maxWidth, widget.maxHeight);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(height: 10000,child: widget.child,),
    );
  }
}
