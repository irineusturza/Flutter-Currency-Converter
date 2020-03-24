import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// import model
import 'package:currency_converter/models/currency/currency_model.dart';

class CurrencyController {

  CurrencyController();

  final request = "https://api.hgbrasil.com/finance/quotations?key=176a98d4";

  Future<Map> getCurrencies() async {
    http.Response response = await http.get(request);
    //print(json.decode(response.body));        
    return json.decode(response.body);
  }

  void getter(BuildContext context) {
    CurrencyModel viewModel = Provider.of<CurrencyModel>(context, listen: false);
    //TODO Add code here for getter
    viewModel.getter();
  }

  void setter(BuildContext context) {
    CurrencyModel viewModel = Provider.of<CurrencyModel>(context, listen: false);
    //TODO Add code here for setter
    viewModel.setter();
  }

  void update(BuildContext context) {
    CurrencyModel viewModel = Provider.of<CurrencyModel>(context, listen: false);
    //TODO Add code here for update
    viewModel.update();
  }

  void remove(BuildContext context) {
    CurrencyModel viewModel = Provider.of<CurrencyModel>(context, listen: false);
    //TODO Add code here for remove
    viewModel.remove();
  }
}