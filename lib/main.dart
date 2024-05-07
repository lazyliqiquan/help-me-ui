import 'package:fluent_ui/fluent_ui.dart';
import 'package:help_me_ui/config/screen.dart';
import 'package:help_me_ui/config/theme.dart';
import 'package:help_me_ui/pages/routes.dart';
import 'package:help_me_ui/utils/local_store.dart' as local_store;
import 'package:help_me_ui/utils/network.dart' as network;
import 'package:url_strategy/url_strategy.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

void main() {
  setPathUrlStrategy();
//给每次请求的headers加上token
  network.dio.interceptors
      .add(InterceptorsWrapper(onRequest: (options, handler) {
    options.headers['Authorization'] = local_store.getHash('token');
    return handler.next(options);
  }));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeModel()),
    ChangeNotifierProvider(create: (_) => ScreenModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeModel themeModel = context.watch<ThemeModel>();
    return FluentApp.router(
      title: 'help me',
      debugShowCheckedModeBanner: false,
      color: themeModel.color,
      darkTheme: FluentThemeData(
          brightness: Brightness.dark,
          accentColor: themeModel.color,
          visualDensity: VisualDensity.standard,
          focusTheme: FocusThemeData(
            glowFactor: is10footScreen(context) ? 2.0 : 0.0,
          )),
      theme: FluentThemeData(
        scrollbarTheme: ScrollbarThemeData(
            backgroundColor: Colors.transparent,
            scrollbarColor: Colors.grey[110],
            scrollbarPressingColor: Colors.grey[140],
            thickness: 15,
            hoveringThickness: 15,
            radius: const Radius.circular(0),
            hoveringRadius: const Radius.circular(0)),
        accentColor: themeModel.color,
        visualDensity: VisualDensity.standard,
        activeColor: Colors.purple,
        // inactiveBackgroundColor: Colors.blue,//弹窗的背景颜色
        // inactiveColor: Colors.orangeAccent,//输入文本的时候出现的光标的颜色
        focusTheme: FocusThemeData(
          glowFactor: is10footScreen(context) ? 2.0 : 0.0,
        ),
      ),
      locale: themeModel.locale,
      routerConfig: WebRouter().goRouter,
    );
  }
}
