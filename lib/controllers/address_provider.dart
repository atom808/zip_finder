import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:zip_finder/global/services/network_service.dart';

import '../models/address_model.dart';

class AddressProvider with ChangeNotifier {
  late AddressModel address;
  bool loading = false;

  getAddress(context, {required String cep}) async {
    loading = true;
    await NetworkService()
        .request('viacep.com.br/ws/$cep/json/', method: HttpMethod.getMethod)
        .then((response) {
      address = AddressModel.fromJson(response);
      loading = false;
    }).catchError((error) {
      log(error.toString());
    });

    notifyListeners();
  }
}
