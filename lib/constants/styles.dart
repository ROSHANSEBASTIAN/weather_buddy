import 'package:weather_buddy/utils/basic_imports.dart';

class AppStyles {
  // textStyles

  // headers
  static const h1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.grey5,
  );
  static const h2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.grey5,
  );
  static const h3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.grey5,
  );
  static const h4 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.grey5,
  );

  static const h5 = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: AppColors.grey5,
  );

  // para
  static const p1 = TextStyle(
    fontSize: 20,
    color: AppColors.grey5,
  );
  static const p2 = TextStyle(
    fontSize: 18,
    color: AppColors.grey5,
  );
  static const p3 = TextStyle(
    fontSize: 16,
    color: AppColors.grey5,
  );
  static const p4 = TextStyle(
    fontSize: 14,
    color: AppColors.grey5,
  );

  // boxDecoration

  // outlineBorder
  static const outlineBorder1 = OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.primaryColor,
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

  static const decorationGradient1 = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 1),
      colors: <Color>[
        Color.fromARGB(255, 1, 111, 110),
        Color.fromARGB(255, 17, 122, 120),
        Color.fromARGB(255, 38, 153, 151),
        Color.fromARGB(255, 45, 171, 169),
        Color.fromARGB(255, 104, 193, 191),
        Color.fromARGB(255, 156, 216, 215),
        Color.fromARGB(255, 142, 170, 170),
      ], // Gradient from https://learnui.design/tools/gradient-generator.html
      tileMode: TileMode.mirror,
    ),
  );
}
