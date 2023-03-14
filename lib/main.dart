import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:zip_finder/global/utils/theme_util.dart';
import 'package:zip_finder/views/home_view.dart';
import 'package:zip_finder/views/splash_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('addressHistoryBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeUtil(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeUtil>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: const AppBarTheme(
                  color: Colors.deepPurple,
                  actionsIconTheme: IconThemeData(color: Colors.white),
                  titleTextStyle: TextStyle(color: Colors.white)),
              iconTheme: const IconThemeData(color: Colors.deepPurple),
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple,
              ).copyWith(
                secondary: Colors.teal,
                brightness: Brightness.light,
              ),
              scaffoldBackgroundColor: Colors.grey.shade100),
          darkTheme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.grey.shade900),
            brightness: Brightness.dark,
            iconTheme: const IconThemeData(color: Colors.white),
            colorScheme: const ColorScheme.dark().copyWith(
              secondary: Colors.teal,
              brightness: Brightness.dark,
              background: Colors.grey.shade800,
              primary: Colors.deepPurple,
            ),
            scaffoldBackgroundColor: Colors.grey.shade800,
          ),
          themeMode: themeProvider.themeMode,
          home: const SplashScreen(),
        );
      },
    );
  }
}
