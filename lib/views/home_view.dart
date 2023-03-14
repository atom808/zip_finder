import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zip_finder/global/widgets/default_appbar.dart';
import 'package:zip_finder/views/search_view.dart';
import 'package:zip_finder/views/settings_view.dart';

import '../global/utils/theme_util.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        titleText: 'Buscador de CEP',
        showPop: false,
        trailing: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsView()),
            ),
          )
        ],
      ),
      body: _buildHomeBody(context),
    );
  }
}

Widget _buildHomeBody(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildHomeButton(
              title: 'Buscar CEP',
              icon: Icons.search,
              context: context,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              ),
            ),
            const VerticalDivider(width: 12),
            _buildHomeButton(
              title: 'Histórico',
              icon: Icons.history,
              context: context,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsView(),
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget _buildHomeButton({
  required String title,
  required IconData icon,
  required BuildContext context,
  required Function() onTap,
}) {
  final themeProvider = Provider.of<ThemeUtil>(context);
  return Flexible(
    flex: 1,
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        onTap.call();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        width: double.infinity / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: themeProvider.isDarkMode
              ? Colors.grey.shade900
              : Theme.of(context).colorScheme.primary,
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 56,
              ),
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ]),
      ),
    ),
  );
}
