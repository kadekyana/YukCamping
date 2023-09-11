import 'package:flutter/material.dart';

// ignore: camel_case_types
class Custom_Cards extends StatelessWidget {
  Custom_Cards(
      {Key? key,
      required this.OnPressed,
      required this.foto,
      required this.judul,
      required this.decs})
      : super(key: key);

  final Function() OnPressed;
  final AssetImage foto;
  final String judul;
  final String decs;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: OnPressed,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Color(0xffFFA500),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.15,
                margin: const EdgeInsets.only(left: 15, right: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: foto,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Text(
                        judul,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.10,
                      child: Center(
                        child: LayoutBuilder(builder: (context, constraints) {
                          double Screen = constraints.maxWidth;
                          double font = Screen * 0.05;

                          return Text(
                            decs,
                            style: TextStyle(
                              fontSize: font,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.justify,
                          );
                        }),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
