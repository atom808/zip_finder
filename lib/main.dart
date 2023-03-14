import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zip_finder/global/utils/theme_util.dart';
import 'package:zip_finder/views/home_view.dart';

void main() {
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
              appBarTheme: AppBarTheme(color: Colors.grey.shade900),
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
          home: const HomeView(),
        );
      },
    );
  }
}
