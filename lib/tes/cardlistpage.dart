import 'package:YukCamping/tes/customcard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CardListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kartu'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final cards = snapshot.data!.docs;
            return ListView.separated(
              itemCount: cards.length,
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemBuilder: (context, index) {
                final card = cards[index];
                final title = card['email'];
                final description = card['name'];
                return ListTile(
                  title: Text(title),
                  subtitle: Text(description),
                  onTap: () {
                    // Navigasi ke halaman selanjutnya dengan mengirim data card ke halaman baru jika diperlukan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage(cardData: card),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final QueryDocumentSnapshot cardData;

  NextPage({required this.cardData});

  @override
  Widget build(BuildContext context) {
    // Gunakan cardData untuk menampilkan data di halaman selanjutnya jika diperlukan
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Selanjutnya'),
      ),
      body: Center(
        child: Text('Detail Data: ${cardData['email']}'),
      ),
    );
  }
}
