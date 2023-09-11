import 'package:YukCamping/button/custom_simple.dart';
import 'package:YukCamping/controller/cart_controller.dart';
import 'package:YukCamping/core.dart';
import 'package:YukCamping/home.dart';
import 'package:YukCamping/keranjang/cart_item.dart';
import 'package:YukCamping/keranjang/cart_total.dart';
import 'package:YukCamping/keranjang/cart.dart';
import 'package:YukCamping/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button/custom.dart';

class Detail_Product extends StatefulWidget {
  final CartItem item;

  const Detail_Product({Key? key, required this.item}) : super(key: key);

  @override
  State<Detail_Product> createState() => _Detail_Product();
}

class _Detail_Product extends State<Detail_Product> {
  final cartController = Get.put(CartController());
  int _currentIndex = 0;
  late CartItem selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.item;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Destination Detail"),
          backgroundColor: Colors.amber,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.amber,
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Image(
                          image: AssetImage(selectedItem.ImgSee),
                          fit: BoxFit.cover),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: Colors.black)),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(
                        selectedItem.name,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.black)),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Title(
                            color: Colors.black,
                            child: Text(
                              'Description :',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              selectedItem.Des,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          Text(
                            '- Lokasi : ${selectedItem.lokasi}',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            '- Paket : ${selectedItem.paket}',
                            style:
                                TextStyle(fontFamily: 'Poppins', fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: 300,
                height: 80,
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(selectedItem.name),
                      subtitle: Text('Rp.${selectedItem.price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          cartController.tambahItem(selectedItem);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
