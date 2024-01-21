import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tugas2_mobile_app_produk/detail_produk.dart';
import 'package:tugas2_mobile_app_produk/edit_produk.dart';
import 'package:tugas2_mobile_app_produk/tambah_produk.dart';

class HalamanProduk extends StatefulWidget {
  const HalamanProduk({super.key});

  @override
  State<HalamanProduk> createState() => _HalamanProdukState();
}

class _HalamanProdukState extends State<HalamanProduk> {
  List _listdata = [];
  bool _loading = true;

  Future _getdata() async {
    try {
      final respon =
          await http.get(Uri.parse('http:/10.128.241.150/api_produk/read.php'));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        setState(() {
          _listdata = data;
          _loading = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Produk'),
        backgroundColor: Colors.deepOrange,
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _listdata.length,
              itemBuilder: ((context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailProduk(
                                    ListData: {
                                      'id': _listdata[index]['id'],
                                      'nama_produk': _listdata[index]
                                          ['nama_produk'],
                                      'harga_produk': _listdata[index]
                                          ['harga_produk'],
                                    },
                                  )));
                    },
                    child: ListTile(
                        title: Text(_listdata[index]['nama_produk']),
                        subtitle: Text(_listdata[index]['harga_produk']),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UbahProduk(
                                                ListData: {
                                                  'id': _listdata[index]['id'],
                                                  'nama_produk':
                                                      _listdata[index]
                                                          ['nama_produk'],
                                                  'harga_produk':
                                                      _listdata[index]
                                                          ['harga_produk'],
                                                },
                                              )));
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text('Yakin Hapus data ?'),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text('Hapus')),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.deepOrange),
                                              child: Text('Batal'))
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        )),
                  ),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
          child: Text(
            '+',
            style: TextStyle(fontSize: 24),
          ),
          backgroundColor: Colors.deepOrange,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TambahProduk()));
          }),
    );
  }
}




// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:tugas2_mobile_app_produk/detail_produk.dart';
// import 'package:tugas2_mobile_app_produk/edit_produk.dart';
// import 'package:tugas2_mobile_app_produk/tambah_produk.dart';

// class HalamanProduk extends StatefulWidget {
//   const HalamanProduk({super.key});

//   @override
//   State<HalamanProduk> createState() => _HalamanProdukState();
// }

// class _HalamanProdukState extends State<HalamanProduk> {
//   List _listdata = [];
//   bool _loading = true;

//   get id => null;

//   Future _getdata() async {
//     try {
//       final respon =
//           await http.get(Uri.parse('http://localhost/api_produk/read.php'));
//       if (respon.statusCode == 200) {
//         final data = jsonDecode(respon.body);
//         setState(() {
//           _listdata = data;
//           _loading = false;
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

  // Future _hapus(listdata) async {
  //   try {
  //     final respon = await http
  //         .post(Uri.parse('http://localhost/api_produk/delete.php'), body: {
  //       "id": id,
  //     });
  //     if (respon.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }

//     void initState() {
//       _getdata();
//       super.initState();
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Halaman Produk'),
//           backgroundColor: Colors.deepOrange,
//         ),
//         body: _loading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : ListView.builder(
//                 itemCount: _listdata.length,
//                 itemBuilder: ((context, index) {
//                   return Card(
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailProduk(ListData: {
//                                 'id': _listdata[index]['id'],
//                                 'nama_produk': _listdata[index]['nama_produk'],
//                                 'harga_produk': _listdata[index]
//                                     ['harga_produk'],
//                               }),
//                             ));
//                       },
//                       child: ListTile(
//                         title: Text(_listdata[index]['nama_produk']),
//                         subtitle: Text(_listdata[index]['harga_produk']),
//                         trailing: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => UbahProduk(
//                                                 ListData: {
//                                                   'id': _listdata[index]['id'],
//                                                   'nama_produk':
//                                                       _listdata[index]
//                                                           ['nama_produk'],
//                                                   'harga_produk':
//                                                       _listdata[index]
//                                                           ['harga_produk'],
//                                                 },
//                                               )));
//                                 },
//                                 icon: Icon(Icons.edit)),
                            // IconButton(
                            //   onPressed: () {
                            //     showDialog(
                            //         barrierDismissible: false,
                            //         context: context,
                            //         builder: (context) {
                            //           return AlertDialog(
                            //             content: Text('Yakin Hapus data ?'),
                            //             actions: [
                            //               ElevatedButton(
                            //                   onPressed: () {
                            //                     _hapus(_listdata[index]['id'])
                            //                         .then((value) {
                            //                       Navigator.pushAndRemoveUntil(
                            //                           context,
                            //                           MaterialPageRoute(
                            //                               builder: ((context) =>
                            //                                   HalamanProduk())),
                            //                           (route) => false);
                            //                     });
                            //                   },
                            //                   child: Text('Hapus')),
                            //               ElevatedButton(
                            //                   onPressed: () {
                            //                     Navigator.of(context).pop();
                            //                   },
                            //                   style: ElevatedButton.styleFrom(
                            //                       backgroundColor:
                            //                           Colors.deepOrange),
                            //                   child: Text('Batal'))
                            //             ],
                            //           );
                            //         });
                            //   },
                            //   icon: Icon(Icons.delete),
                            // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//         floatingActionButton: FloatingActionButton(
//             child: Text(
//               '+',
//               style: TextStyle(fontSize: 24),
//             ),
//             backgroundColor: Colors.deepOrange,
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => TambahProduk()));
//             }),
//       );
//     }
//   }
