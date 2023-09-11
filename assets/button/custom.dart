import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  const Custom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "Custom",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
