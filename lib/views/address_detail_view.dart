import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zip_finder/global/widgets/default_appbar.dart';
import 'package:zip_finder/models/address_model.dart';

import '../global/utils/theme_util.dart';
import '../global/widgets/custom_textfield.dart';

class AddressDetailView extends StatelessWidget {
  final List<Map> addressFieldsList;
  final Function()? onPopCallback;
  const AddressDetailView(
      {super.key, required this.addressFieldsList, this.onPopCallback});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeUtil>(context);
    return WillPopScope(
      onWillPop: () async {
        onPopCallback?.call();
        return true;
      },
      child: Scaffold(
        appBar: DefaultAppBar(titleText: 'Detalhes do Endereço'),
        body: Card(
          margin: const EdgeInsets.all(24),
          color: themeProvider.isDarkMode ? Colors.grey.shade900 : Colors.white,
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
                controller: addressFieldsList[0]['controller'],
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CepInputFormatter(ponto: false),
                ],
                placeholder: 'CEP',
                enabled: false,
                readOnly: true,
              ),
              CustomTextField(
                context: context,
                controller: addressFieldsList[1]['controller'],
                placeholder: 'Logradouro',
                enabled: false,
                readOnly: true,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: addressFieldsList.length - 2,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 72,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) => CustomTextField(
                  context: context,
                  controller: addressFieldsList[index + 2]['controller'],
                  placeholder: addressFieldsList[index + 2]['placeholder'],
                  enabled: false,
                  readOnly: true,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
