import 'dart:typed_data';

import 'package:currency_converter/views/currency/components/widget_currencyTextField.dart';
import 'package:currency_converter/views/currency/components/widget_loadingStatus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import model
import 'package:currency_converter/models/currency/currency_model.dart';
// import controller
import 'package:currency_converter/controllers/currency/currency_controller.dart';

class CurrencyView extends StatefulWidget {
  @override
  _CurrencyViewState createState() => _CurrencyViewState();
}

class _CurrencyViewState extends State<CurrencyView> {
  double dollar;
  double euro;

  TextEditingController realController = TextEditingController();
  TextEditingController dollarController = TextEditingController();
  TextEditingController euroController = TextEditingController();

  void _realChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dollarController.text = (real/dollar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);
  }

  void _dollarChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double dollar = double.parse(text);
    realController.text = (dollar*this.dollar).toStringAsFixed(2);
    euroController.text = ((dollar*this.dollar)/euro).toStringAsFixed(2);
  }

  void _euroChanged(String text){
    if(text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro*this.euro).toStringAsFixed(2);
    dollarController.text = ((euro*this.euro)/dollar).toStringAsFixed(2);
  }

  void _clearAll(){
    realController.text = "";
    dollarController.text = "";
    euroController.text = "";
  }


  @override
  void initState() {
    super.initState();

    CurrencyController().getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    CurrencyController currencyController = CurrencyController();
    return ChangeNotifierProvider<CurrencyModel>(
      create: (context) => CurrencyModel.instance(),
      child: Consumer<CurrencyModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text("\$ Currency Converter \$"),
              backgroundColor: Colors.amber,
              centerTitle: true,
            ),
            body: FutureBuilder<Map>(
              future: currencyController.getCurrencies(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return LoadingStatus(
                      msg: "Loading data",
                    );

                    break;
                  default:
                    if (snapshot.hasError) {
                      return LoadingStatus(
                        msg: "Error",
                      );
                    } else {

                      dollar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                      euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];


                      return SingleChildScrollView(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Icon(
                              Icons.monetization_on,
                              size: 150.0,
                              color: Colors.amber,
                            ),
                            WidgetCurrencyTextField(
                              labelText: "Real",
                              prefixText: "R\$ ",
                              textEditingController: realController,
                              changed: _realChanged
                            ),
                            Divider(),
                            WidgetCurrencyTextField(
                              labelText: "Dollar",
                              prefixText: "USD ",
                              textEditingController: dollarController,
                              changed: _dollarChanged,
                            ),
                            Divider(),
                            WidgetCurrencyTextField(
                              labelText: "Euro",
                              prefixText: "€ ",
                              textEditingController: euroController,
                              changed: _euroChanged,
                            )
                          ],
                        ),
                      );
                    }
                }
              },
            ),
          );
        },
      ),
    );
  }
}
