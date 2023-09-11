import 'package:YukCamping/cards/custom_cards.dart';
import 'package:YukCamping/controller/cart_controller.dart';
import 'package:YukCamping/detail_pruduct.dart';
import 'package:YukCamping/keranjang/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Camp extends StatefulWidget {
  const Camp({Key? key}) : super(key: key);

  @override
  State<Camp> createState() => _CampState();
}

class _CampState extends State<Camp> {
  final CartController controller = Get.find();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<CartItem> filteredItems = CartItem.item.where((item) {
      final itemName = item.name.toLowerCase();
      final query = searchQuery.toLowerCase();
      return itemName.contains(query);
    }).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                height: 50,
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                child: ListView.builder(
                  itemCount: filteredItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Custom_Cards(
                      OnPressed: () {
                        Get.to(Detail_Product(
                          item: filteredItems[index],
                        ));
                      },
                      foto: AssetImage(filteredItems[index].ImgSee),
                      judul: filteredItems[index].name,
                      decs: filteredItems[index].Des,
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
