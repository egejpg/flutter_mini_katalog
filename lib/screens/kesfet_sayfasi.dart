import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/urun.dart';
import 'sepet_sayfasi.dart';
import 'urun_detay_sayfasi.dart';

// --- 2. Ana Sayfa (Keşfet) ---
class KesfetSayfasi extends StatefulWidget {
  const KesfetSayfasi({super.key});

  @override
  State<KesfetSayfasi> createState() => _KesfetSayfasiState();
}

class _KesfetSayfasiState extends State<KesfetSayfasi> {
  List<Urun> sepet = [];

  late Future<List<Urun>> urunlerFuture;
  String aramaMetni = "";

  @override
  void initState() {
    super.initState();
    // Veriyi sayfa ilk açıldığında sadece bir kez çekiyoruz.
    urunlerFuture = urunleriGetir();
  }

  Future<List<Urun>> urunleriGetir() async {
    final cevap = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (cevap.statusCode == 200) {
      List<dynamic> data = json.decode(cevap.body);
      return data.map((j) => Urun.fromJson(j)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  void sepeteEkle(Urun u) {
    setState(() {
      sepet.add(u);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Discover',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SepetSayfasi(sepet: sepet),
                    ),
                  );
                },
              ),
              if (sepet.isNotEmpty)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: Text(
                      '${sepet.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- Banner Kısmı ---
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  'https://wantapi.com/assets/banner.png',
                  width:
                      double.infinity, // Genişliği ekranın sonuna kadar yay
                  fit: BoxFit
                      .fitWidth, 
                ),
              ),
            ),

            // Çalışan Arama Çubuğu
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  onChanged: (deger) {
                    // Kullanıcı yazı yazdıkça ekranı günceller
                    setState(() {
                      aramaMetni = deger;
                    });
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.search),
                    hintText: 'Search products...',
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            FutureBuilder<List<Urun>>(
              future:
                  urunlerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) return Text('Error: ${snapshot.error}');

                // Arama metnine göre ürünleri filtreleme kısmı
                final urunler = snapshot.data!.where((u) {
                  return u.isim.toLowerCase().contains(
                    aramaMetni.toLowerCase(),
                  );
                }).toList();

                if (urunler.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'No products found matching your search.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: urunler.length,
                  itemBuilder: (context, index) {
                    final u = urunler[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UrunDetaySayfasi(
                              secilenUrun: u,
                              sepeteEkleCallback: sepeteEkle,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.network(u.resimUrl),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                u.isim,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              '\$${u.fiyat}',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
