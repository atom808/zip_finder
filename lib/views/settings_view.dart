import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zip_finder/global/utils/theme_util.dart';
import 'package:zip_finder/global/widgets/default_appbar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeUtil>(context);
    return Scaffold(
      appBar: DefaultAppBar(titleText: 'Configurações'),
      body: Column(children: [
        ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          leading: const Icon(Icons.dark_mode),
          title: const Text(
            'Tema escuro',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: Switch(
            value: themeProvider.isDarkMode,
            onChanged: (value) {
              final provider = Provider.of<ThemeUtil>(context, listen: false);
              provider.toggleTheme(value);
            },
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        )
      ]),
    );
  }
}
