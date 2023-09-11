import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CartItem {
  // final String id;
  final String name;
  final double price;
  final String ImgSee;
  final String Des;
  final String lokasi;
  final String paket;

  CartItem({
    // required this.id,
    required this.name,
    required this.price,
    required this.ImgSee,
    required this.Des,
    required this.lokasi,
    required this.paket,
  });

  static List<CartItem> item = [
    CartItem(
      name: "Pinggan Sunrise Camping",
      price: 300.000,
      Des:
          "Pinggan Sunrise Camping adalah salah satu spot terbaik di Bali untuk melihat sunrise dan bermalam dengan menggunakan tenda yang telah disediakan.Disini peralatan camping cukup lengkap dan dengan harga yang terjangkau.Untuk mengetahui info lebih lanjut anda bisa Whats app kami di nomer +6281916999870 selain itu ,Pinggan Sunrise Camping merupakan tempat camping yang terletak di daerah Kintamani yang terkenal dengan destinasi wisata alamnya seperti gunung batur dan munuk bumbulan.",
      lokasi: "Jalan Raya Pinggan, Kintamani, Bangli, Bali.",
      paket:
          'Seharga Rp.300.000,00 Include : Tenda, Sleeping Bag, Lampu Tenda, Terpal dan Kayu Bakar.',
      ImgSee: 'assets/best1.png',
    ),
    CartItem(
      name: "Bukit Asah",
      price: 300.000,
      Des:
          "Pinggan Sunrise Camping adalah salah satu spot terbaik di Bali untuk melihat sunrise dan bermalam dengan menggunakan tenda yang telah disediakan.Disini peralatan camping cukup lengkap dan dengan harga yang terjangkau.Untuk mengetahui info lebih lanjut anda bisa Whats app kami di nomer +6281916999870 selain itu ,Pinggan Sunrise Camping merupakan tempat camping yang terletak di daerah Kintamani yang terkenal dengan destinasi wisata alamnya seperti gunung batur dan munuk bumbulan.",
      lokasi: "Jalan Raya Pinggan, Kintamani, Bangli, Bali.",
      paket:
          'Seharga Rp.300.000,00 Include : Tenda, Sleeping Bag, Lampu Tenda, Terpal dan Kayu Bakar.',
      ImgSee: 'assets/best1.png',
    ),
    CartItem(
      name: "Gunung Abang",
      price: 300.000,
      Des:
          "Pinggan Sunrise Camping adalah salah satu spot terbaik di Bali untuk melihat sunrise dan bermalam dengan menggunakan tenda yang telah disediakan.Disini peralatan camping cukup lengkap dan dengan harga yang terjangkau.Untuk mengetahui info lebih lanjut anda bisa Whats app kami di nomer +6281916999870 selain itu ,Pinggan Sunrise Camping merupakan tempat camping yang terletak di daerah Kintamani yang terkenal dengan destinasi wisata alamnya seperti gunung batur dan munuk bumbulan.",
      lokasi: "Jalan Raya Pinggan, Kintamani, Bangli, Bali.",
      paket:
          'Seharga Rp.300.000,00 Include : Tenda, Sleeping Bag, Lampu Tenda, Terpal dan Kayu Bakar.',
      ImgSee: 'assets/best1.png',
    ),
    CartItem(
      name: "Gunung Batur",
      price: 300.000,
      Des:
          "Pinggan Sunrise Camping adalah salah satu spot terbaik di Bali untuk melihat sunrise dan bermalam dengan menggunakan tenda yang telah disediakan.Disini peralatan camping cukup lengkap dan dengan harga yang terjangkau.Untuk mengetahui info lebih lanjut anda bisa Whats app kami di nomer +6281916999870 selain itu ,Pinggan Sunrise Camping merupakan tempat camping yang terletak di daerah Kintamani yang terkenal dengan destinasi wisata alamnya seperti gunung batur dan munuk bumbulan.",
      lokasi: "Jalan Raya Pinggan, Kintamani, Bangli, Bali.",
      paket:
          'Seharga Rp.300.000,00 Include : Tenda, Sleeping Bag, Lampu Tenda, Terpal dan Kayu Bakar.',
      ImgSee: 'assets/best1.png',
    ),
    CartItem(
      name: "Gunung Batur Camping (Culali)",
      ImgSee: 'assets/best2.png',
      price: 150.000,
      Des:
          "Pinggan Sunrise Camping adalah salah satu spot terbaik di Bali untuk melihat sunrise dan bermalam dengan menggunakan tenda yang telah disediakan.Disini peralatan camping cukup lengkap dan dengan harga yang terjangkau.Untuk mengetahui info lebih lanjut anda bisa Whats app kami di nomer +6281916999870 selain itu ,Pinggan Sunrise Camping merupakan tempat camping yang terletak di daerah Kintamani yang terkenal dengan destinasi wisata alamnya seperti gunung batur dan munuk bumbulan.",
      lokasi: "Jalan Raya Pinggan, Kintamani, Bangli, Bali.",
      paket:
          "Seharga Rp.150.000,00 Include : Tenda, Sleeping Bag, Lampu Tenda, Terpal dan Kayu Bakar.",
    )
  ];
}
