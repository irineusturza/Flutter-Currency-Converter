import 'package:flutter/material.dart';

enum CurrencyModelStatus {
  Ended,
  Loading,
  Error
}

class CurrencyModel extends ChangeNotifier {
  CurrencyModelStatus _status;
  String _errorCode;
  String _errorMessage;

  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  CurrencyModelStatus get status => _status;

  CurrencyModel();

  CurrencyModel.instance() {
    //TODO Add code here
  }
  
  void getter() {
    _status = CurrencyModelStatus.Loading;
    notifyListeners();

    //TODO Add code here

    _status = CurrencyModelStatus.Ended;
    notifyListeners();
  }

  void setter() {
     _status = CurrencyModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = CurrencyModelStatus.Ended;
    notifyListeners();
  }

  void update() {
    _status = CurrencyModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = CurrencyModelStatus.Ended;
    notifyListeners();
  }

  void remove() {
    _status = CurrencyModelStatus.Loading;
    notifyListeners();

    //TODO Add code here
    
    _status = CurrencyModelStatus.Ended;
    notifyListeners();
  }
}