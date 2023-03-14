import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zip_finder/controllers/address_provider.dart';
import 'package:zip_finder/global/utils/string_util.dart';
import 'package:zip_finder/global/widgets/custom_textfield.dart';
import 'package:zip_finder/global/widgets/default_appbar.dart';
import 'package:zip_finder/views/address_detail_view.dart';

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
    _provider.getAddressBox();
    _fieldList = [
      {'controller': _provider.cepController, 'placeholder': 'CEP'},
      {
        'controller': _provider.logradouroController,
        'placeholder': 'Logradouro'
      },
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
    return Scaffold(
      appBar: DefaultAppBar(titleText: 'Buscar CEP'),
      body: Column(
        children: [
          CustomTextField(
              context: context,
              margin: const EdgeInsets.all(24),
              controller: _provider.cepController,
              placeholder: 'Insira o CEP que deseja buscar',
              maxLength: 9,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(ponto: false),
              ],
              enabled: !_provider.loading,
              onChanged: (text) {
                if (text.length == 9) {
                  _getAddressCall(text);
                }
              }),
          const Divider(),
          const Text(
            'Histórico',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(
            color: Colors.transparent,
          ),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: _provider.addresses.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () => setState(() {
                _provider.cepController.text =
                    _provider.addresses[index]['cep'];
                _getAddressCall(_provider.addresses[index]['cep']);
              }),
              title: Text(_provider.addresses[index]['cep']),
            ),
          ))
        ],
      ),
    );
  }

  _getAddressCall(String? text) {
    _provider.getAddress(
      context,
      cep: text!.cleanStringAndSpaces,
      onSuccess: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddressDetailView(
              addressFieldsList: _fieldList,
              onPopCallback: () {
                setState(() {
                  _provider.getAddressBox();
                });
              },
            ),
          )),
    );
  }
}
