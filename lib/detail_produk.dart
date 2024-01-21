import 'package:flutter/material.dart';

class DetailProduk extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final Map ListData;
  const DetailProduk({Key? key, required this.ListData}) : super(key: key);

  // const DetailProduk({super.key, required Map<String, dynamic> ListData});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  final formKey = GlobalKey<FormState>();
  TextEditingController id = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController nama_produk = TextEditingController();
  TextEditingController harga_produk = TextEditingController();

  @override
  Widget build(BuildContext context) {
    id.text = widget.ListData['id'];
    nama_produk = widget.ListData['nama_produk'];
    harga_produk = widget.ListData['harga_produk'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Card(
          elevation: 12,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text('id'),
                  subtitle: Text(widget.ListData['id']),
                ),
                ListTile(
                  title: Text('Nama Produk'),
                  subtitle: Text(widget.ListData['nama_produk']),
                ),
                ListTile(
                  title: Text('Harga Produk'),
                  subtitle: Text(widget.ListData['harga_produk']),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
