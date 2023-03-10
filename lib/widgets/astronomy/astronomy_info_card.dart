import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_buddy/utils/log.dart';
import '../../utils/basic_imports.dart';

import '../../blocs/astronomy/astronomy_bloc.dart';
import '../../models/astro_info/astro_info.dart';
import '../../widgets/common/empty_component.dart';

class AstronomyInfoCard extends StatelessWidget {
  const AstronomyInfoCard({Key? key}) : super(key: key);

  Widget renderKeyValuePair({required String key, required String value}) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              key,
              textAlign: TextAlign.start,
              style: AppStyles.p3,
            ),
            Text(
              value,
              textAlign: TextAlign.start,
              style: AppStyles.h3,
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 7),
      child: Column(
        children: [
          Image.asset("assets/images/moon.png"),
          BlocBuilder<AstronomyBloc, AstronomyState>(
            builder: (context, state) {
              if (state is AstronomyInfoLoadSuccess) {
                final AstroInfo astro = state.astroInfo;
                Log.astroLog(
                  "Received astro log data in widget ${state.astroInfo}",
                );
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        renderKeyValuePair(
                          key: AppLocalizations.of(context)!.moon_phase,
                          value: astro.astronomy!.astro!.moonPhase!,
                        ),
                        renderKeyValuePair(
                          key: AppLocalizations.of(context)!.moon_rise,
                          value: astro.astronomy!.astro!.moonrise!,
                        ),
                        renderKeyValuePair(
                          key: AppLocalizations.of(context)!.moon_set,
                          value: astro.astronomy!.astro!.moonset!,
                        ),
                        renderKeyValuePair(
                          key: AppLocalizations.of(context)!.moon_illumination,
                          value: astro.astronomy!.astro!.moonIllumination!,
                        ),
                        renderKeyValuePair(
                          key: AppLocalizations.of(context)!.sun_rise,
                          value: astro.astronomy!.astro!.sunrise!,
                        ),
                        renderKeyValuePair(
                          key: AppLocalizations.of(context)!.sun_set,
                          value: astro.astronomy!.astro!.sunset!,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is AstronomyInfoLoading) {
                return EmptyComponent(
                  loading: true,
                  isAList: true,
                  loadingColor: AppColors.grey5,
                );
              } else if (state is AstronomyInfoLoadError) {
                return EmptyComponent(
                  loading: false,
                  isAList: true,
                  error: state.error,
                );
              } else {
                return EmptyComponent(
                  loading: false,
                  isAList: true,
                  emptyText: AppLocalizations.of(context)!.no_data_found,
                );
              }
            },
          )
        ],
      ),
    );
  }
}
