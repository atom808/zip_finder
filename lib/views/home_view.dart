import 'package:flutter/material.dart';
import 'package:zip_finder/global/widgets/default_appbar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(titleText: 'Buscador de CEP'),
      body: _buildHomeBody(),
    );
  }
}

Widget _buildHomeBody() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildHomeButton(title: 'Buscar CEP', icon: Icons.search),
            const VerticalDivider(width: 12),
            _buildHomeButton(title: 'Histórico', icon: Icons.history),
          ],
        ),
      )
    ],
  );
}

Widget _buildHomeButton({required String title, required IconData icon}) {
  return Flexible(
    flex: 1,
    child: InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        // Navigator.push(context, route);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        width: double.infinity / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.red,
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
