
import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.orange;
  static const Color secondaryColor = Color.fromARGB(255, 244, 179, 81);
  static const Color thirtyColor = Color.fromARGB(255, 241, 217, 182);
  static const Color scaffoldBbColor = Color(0xFF0C0B0C);
  static const Color textFieldBgColor = Color(0xFF23262B);
  static const Color textColor = Color.fromARGB(255, 230, 230, 230);

  static const Color titleColor = Color(0xFF1ED760);
  static const Color whiteTextColor = Colors.white;
  static const Color greyTextColor = Color(0xFF595959);
  static const Color cardContainer = Color.fromARGB(255, 114, 114, 114) ;

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: const Color.fromARGB(255, 230, 230, 230)
  );

}