import 'package:fluent_ui/fluent_ui.dart';
import 'package:help_me_ui/config/screen.dart';
import 'package:help_me_ui/ui/screen/limit.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Outer(child: Builder(builder: (context) {
      final ScreenModel screenModel = context.watch<ScreenModel>();
      return Center(
        child: Text('${screenModel.maxWidth} - ${screenModel.maxHeight}'),
      );
    }));
  }
}
