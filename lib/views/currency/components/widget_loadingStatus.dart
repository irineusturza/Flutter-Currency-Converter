
import 'package:flutter/material.dart';

class LoadingStatus extends StatelessWidget {
  final String msg;
  LoadingStatus({
    this.msg,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        msg,
        style: TextStyle(
          color: Colors.amber,
          fontSize: 25.0
        ),
        textAlign: TextAlign.center,
        ),
    );
  }
}
