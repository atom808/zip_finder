import 'dart:convert';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:zip_finder/global/utils/string_util.dart';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    required this.cep,
    required this.logradouro,
    this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    this.ibge,
    this.gia,
    required this.ddd,
    this.siafi,
  });

  String cep;
  String logradouro;
  String? complemento;
  String bairro;
  String localidade;
  String uf;
  String? ibge;
  String? gia;
  String ddd;
  String? siafi;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        cep: UtilBrasilFields.obterCep(
            json["cep"].toString().cleanStringAndSpaces),
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        ibge: json["ibge"],
        gia: json["gia"],
        ddd: json["ddd"],
        siafi: json["siafi"],
      );

  Map<String, dynamic> toJson() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
        "ibge": ibge,
        "gia": gia,
        "ddd": ddd,
        "siafi": siafi,
      };
}
