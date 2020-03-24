
import 'package:flutter/material.dart';

class WidgetCurrencyTextField extends StatelessWidget {
  final String labelText;
  final String prefixText;
  final TextEditingController textEditingController;
  final Function changed;


  WidgetCurrencyTextField({
    this.labelText, this.prefixText, this.textEditingController, this.changed
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.amber
        ),
        border: OutlineInputBorder(),
        prefixText: prefixText
      ),
      style: TextStyle(
        color: Colors.amber,
        fontSize: 25.0
      ),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onChanged: changed,
    );
  }
}
