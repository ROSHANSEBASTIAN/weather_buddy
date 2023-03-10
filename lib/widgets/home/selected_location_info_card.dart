import '../../utils/basic_imports.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/settings/settings_bloc.dart';
import '../../models/place/place.dart';
import '../../navigation/routes.dart';

class SelectedLocationInfoCard extends StatelessWidget {
  final BuildContext context;

  const SelectedLocationInfoCard({
    Key? key,
    required this.context,
  }) : super(key: key);

  void editPlaceHandler() {
    Navigator.of(context).pushNamed(placePickerScreen);
  }

  Widget renderCardListItem({required String key, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            key,
            style: AppStyles.p4.copyWith(
              color: AppColors.grey5,
            ),
          ),
          Text(
            value,
            style: AppStyles.h3.copyWith(
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          Place selectedPlace = state.settings.selPlace!;
          return Card(
            elevation: 6,
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            color: AppColors.transparent_90,
            child: Column(children: [
              renderCardListItem(
                key: AppLocalizations.of(context)!.name,
                value: selectedPlace.name!,
              ),
              renderCardListItem(
                key: AppLocalizations.of(context)!.region,
                value: selectedPlace.region!,
              ),
              renderCardListItem(
                key: AppLocalizations.of(context)!.country,
                value: selectedPlace.country!,
              ),
              renderCardListItem(
                key: AppLocalizations.of(context)!.lat,
                value: selectedPlace.lat!.toString(),
              ),
              renderCardListItem(
                key: AppLocalizations.of(context)!.long,
                value: selectedPlace.lon!.toString(),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: editPlaceHandler,
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.accentColor,
                  ),
                ),
              ),
            ]),
          );
        },
      ),
    );
  }
}
