import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zip_finder/controllers/address_provider.dart';
import 'package:zip_finder/global/widgets/custom_textfield.dart';
import 'package:zip_finder/global/widgets/default_appbar.dart';

import '../global/utils/theme_util.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final _cepController = TextEditingController();
  final _logradouroController = TextEditingController();
  final _complementoController = TextEditingController();
  final _numeroController = TextEditingController();
  final _bairroController = TextEditingController();
  final _cidadeController = TextEditingController();
  final _estadoController = TextEditingController();

  final _provider = AddressProvider();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeUtil>(context);
    return Scaffold(
      appBar: DefaultAppBar(titleText: 'Buscar CEP'),
      body: Column(
        children: [
          CustomTextField(
              margin: const EdgeInsets.all(24),
              controller: _cepController,
              placeholder: 'Insira o CEP que deseja buscar',
              maxLength: 8,
              onChanged: (text) {
                if (text.length == 8) {
                  _provider.getAddress(context, cep: text);
                }
              }),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            color:
                themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                const Text(
                  'Informações do Endereço',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(
                  color: Colors.transparent,
                ),
                CustomTextField(
                  controller: _logradouroController,
                  placeholder: 'Logradouro',
                  enabled: false,
                  readOnly: true,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Flexible(
                      flex: 1,
                      child: CustomTextField(
                        controller: _numeroController,
                        placeholder: 'Número',
                        enabled: false,
                        readOnly: true,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: CustomTextField(
                        controller: _complementoController,
                        placeholder: 'Complemento',
                        enabled: false,
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
