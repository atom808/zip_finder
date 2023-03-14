import 'package:flutter/material.dart';
import 'package:zip_finder/views/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3))
        .then((value) => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
          child: Image.asset(
        'assets/icons/icon_zip_search.png',
        height: 150,
      )),
    );
  }
}
