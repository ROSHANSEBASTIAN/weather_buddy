import '../../utils/basic_imports.dart';

class EmptyComponent extends StatelessWidget {
  late bool loading;
  late bool isAList;
  List<dynamic>? list;

  EmptyComponent({
    Key? key,
    required this.loading,
    required this.isAList,
    this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: loading
            ? const CircularProgressIndicator()
            : isAList && (list == null || list!.isEmpty)
                ? const Text("No data found")
                : const SizedBox(
                    height: 0,
                    width: 0,
                  ),
      ),
    );
  }
}
