import 'package:flutter/material.dart';

class Custom extends StatelessWidget {
  const Custom(
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
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          decoration: BoxDecoration(
              color: warnabg,
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Text(
            isi,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600),
          ),
        ));
  }
}
