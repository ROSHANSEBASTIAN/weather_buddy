import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_buddy/blocs/astronomy/astronomy_bloc.dart';
import 'package:weather_buddy/blocs/settings/settings_bloc.dart';
import 'package:weather_buddy/utils/screen_imports.dart';

import '../widgets/astronomy/astronomy_info_card.dart';

class AstronomyScreen extends StatefulWidget {
  const AstronomyScreen({Key? key}) : super(key: key);

  @override
  State<AstronomyScreen> createState() => _AstronomyScreenState();
}

class _AstronomyScreenState extends State<AstronomyScreen> {
  late SettingsBloc _settingsBloc;

  @override
  void initState() {
    super.initState();
    _settingsBloc = BlocProvider.of<SettingsBloc>(context);
    BlocProvider.of<AstronomyBloc>(context).add(
        GetAstronomyInfo(selPlace: _settingsBloc.state.settings.selPlace!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(titleText: AppLocalizations.of(context)!.astronomy),
      backgroundColor: AppColors.grey1,
      body: const AstronomyInfoCard(),
    );
  }
}
