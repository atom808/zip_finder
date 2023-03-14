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
  final _provider = AddressProvider();

  late List<Map> _fieldList;

  @override
  void initState() {
    _fieldList = [
      {
        'controller': _provider.complementoController,
        'placeholder': 'Complemento'
      },
      {'controller': _provider.bairroController, 'placeholder': 'Bairro'},
      {
        'controller': _provider.localidadeController,
        'placeholder': 'Localidade'
      },
      {'controller': _provider.ufController, 'placeholder': 'UF'},
      {'controller': _provider.ibgeController, 'placeholder': 'IBGE'},
      {'controller': _provider.giaController, 'placeholder': 'Gia'},
      {'controller': _provider.dddController, 'placeholder': 'DDD'},
      {'controller': _provider.siafiController, 'placeholder': 'Siafi'},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeUtil>(context);
    return Scaffold(
      appBar: DefaultAppBar(titleText: 'Buscar CEP'),
      body: Column(
        children: [
          CustomTextField(
              context: context,
              margin: const EdgeInsets.all(24),
              controller: _provider.cepController,
              placeholder: 'Insira o CEP que deseja buscar',
              maxLength: 8,
              enabled: !_provider.loading,
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
                  context: context,
                  controller: _provider.logradouroController,
                  placeholder: 'Logradouro',
                  enabled: false,
                  readOnly: true,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: _fieldList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 72,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) => CustomTextField(
                    context: context,
                    controller: _fieldList[index]['controller'],
                    placeholder: _fieldList[index]['placeholder'],
                    enabled: false,
                    readOnly: true,
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
