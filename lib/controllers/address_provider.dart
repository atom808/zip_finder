import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zip_finder/global/services/network_service.dart';

import '../models/address_model.dart';

class AddressProvider with ChangeNotifier {
  late AddressModel address;
  bool loading = false;

  late List addresses;

  //Controllers
  final cepController = TextEditingController();
  final logradouroController = TextEditingController();
  final complementoController = TextEditingController();
  final bairroController = TextEditingController();
  final localidadeController = TextEditingController();
  final ufController = TextEditingController();
  final ibgeController = TextEditingController();
  final giaController = TextEditingController();
  final dddController = TextEditingController();
  final siafiController = TextEditingController();

  getAddress(context,
      {required String cep, required Function() onSuccess}) async {
    loading = true;
    await NetworkService()
        .request('viacep.com.br/ws/$cep/json/', method: HttpMethod.getMethod)
        .then((response) {
      address = AddressModel.fromJson(response);
      setAddressControllers();
      addAddressToHistory(response);
      loading = false;
      onSuccess.call();
    }).catchError((error) {
      loading = false;
      log(error.toString());
    });

    notifyListeners();
  }

  setAddressControllers() {
    logradouroController.text = address.logradouro;
    complementoController.text = address.complemento ?? '';
    bairroController.text = address.bairro;
    localidadeController.text = address.localidade;
    ufController.text = address.uf;
    ibgeController.text = address.ibge ?? '';
    giaController.text = address.gia ?? '';
    dddController.text = address.ddd;
    siafiController.text = address.siafi ?? '';
  }

  addAddressToHistory(dynamic address) async {
    final listBox = Hive.box('addressHistoryBox');
    await listBox.add(address);
  }

  getAddressBox() {
    addresses = Hive.box('addressHistoryBox').values.toList();
  }
}
