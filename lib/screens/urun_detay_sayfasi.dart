import 'package:flutter/material.dart';
import '../models/urun.dart';

// --- 4. Detay Sayfası ---
class UrunDetaySayfasi extends StatefulWidget {
  final Urun secilenUrun;
  final Function(Urun) sepeteEkleCallback;

  const UrunDetaySayfasi({super.key, required this.secilenUrun, required this.sepeteEkleCallback});

  @override
  State<UrunDetaySayfasi> createState() => _UrunDetaySayfasiState();
}

class _UrunDetaySayfasiState extends State<UrunDetaySayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, leading: const BackButton(color: Colors.black)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.network(widget.secilenUrun.resimUrl, height: 250)),
                  const SizedBox(height: 20),
                  Text(widget.secilenUrun.isim, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('\$${widget.secilenUrun.fiyat}', style: const TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(widget.secilenUrun.aciklama, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              onPressed: () {
                widget.sepeteEkleCallback(widget.secilenUrun);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart!')));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: const Size(double.infinity, 56)),
              child: const Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          )
        ],
      ),
    );
  }
}