import 'package:fluent_ui/fluent_ui.dart';
import 'package:help_me_ui/config/screen.dart';
import 'package:help_me_ui/ui/screen/limit.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = context.watch<ScreenModel>().isMobile;
    return ScreenLimit(child: Text(isMobile ? 'mobile1' : 'pc1'));
  }
}
