import '../../utils/basic_imports.dart';

class EmptyComponent extends StatelessWidget {
  final bool loading;
  final bool isAList;
  List<dynamic>? list;
  String? error;
  String? emptyText;
  String? loadingText;
  Function? onReload;
  Color? loadingColor;

  EmptyComponent({
    Key? key,
    required this.loading,
    required this.isAList,
    this.list,
    this.error,
    this.emptyText,
    this.loadingText,
    this.onReload,
    this.loadingColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final showLoader = loading && (error == null || error!.isEmpty);
    final showError = error != null && error!.isNotEmpty;

    return Expanded(
      child: Center(
        child: (showLoader)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                      color: loadingColor ?? AppColors.white),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    loadingText ??
                        AppLocalizations.of(context)!.loading_default,
                    style: AppStyles.p2
                        .copyWith(color: loadingColor ?? AppColors.white),
                  )
                ],
              )
            : showError
                ? Column(
                    children: [
                      Text(
                          error ?? AppLocalizations.of(context)!.error_default),
                      ElevatedButton(
                        onPressed: () {
                          if (onReload != null) {
                            onReload!();
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.try_again),
                      )
                    ],
                  )
                : Text(
                    emptyText ?? AppLocalizations.of(context)!.no_data_found,
                  ),
      ),
    );
  }
}
