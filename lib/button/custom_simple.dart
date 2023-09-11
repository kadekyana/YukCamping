import 'package:flutter/material.dart';

class Custom_Simple extends StatelessWidget {
  const Custom_Simple(
      {Key? key,
      required this.isi,
      required this.warnabg,
      required this.onPressed})
      : super(key: key);

  final String isi;
  final Color warnabg;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          decoration: BoxDecoration(
            color: warnabg,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Text(
            isi,
            style: const TextStyle(
                fontFamily: 'Poppins', fontWeight: FontWeight.bold),
          ),
        ));
  }
}
