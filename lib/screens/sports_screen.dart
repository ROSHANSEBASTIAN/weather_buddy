import '../utils/screen_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/settings/settings_bloc.dart';
import '../../blocs/sports/sports_bloc.dart';
import '../../widgets/sports/sports_list.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  late SettingsBloc _settingsBloc;

  @override
  void initState() {
    super.initState();
    _settingsBloc = BlocProvider.of<SettingsBloc>(context);
    BlocProvider.of<SportsBloc>(context)
        .add(GetSportsEvents(selPlace: _settingsBloc.state.settings.selPlace!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: AppLocalizations.of(context)!.sports),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: AppStyles.decorationGradient1,
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: const SportsList(),
      ),
    );
  }
}
