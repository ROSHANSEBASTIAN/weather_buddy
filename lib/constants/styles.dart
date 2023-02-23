import 'package:weather_buddy/utils/basic_imports.dart';

class AppStyles {
  // textStyles

  // headers
  static const h1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const h2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const h3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const h4 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  // para
  static const p1 = TextStyle(
    fontSize: 20,
  );
  static const p2 = TextStyle(
    fontSize: 18,
  );
  static const p3 = TextStyle(
    fontSize: 16,
  );
  static const p4 = TextStyle(
    fontSize: 14,
  );

  // boxDecoration

  // outlineBorder
  static const outlineBorder1 = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.white,
      width: 1.8,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );

  // inputDecoration
  static const input1 = InputDecoration(
    enabledBorder: outlineBorder1,
    focusedBorder: outlineBorder1,
  );
}
