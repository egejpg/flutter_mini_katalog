import 'package:flutter/material.dart';
import '../models/urun.dart';

// --- 3. Sepet Sayfası ---
class SepetSayfasi extends StatelessWidget {
  final List<Urun> sepet;
  const SepetSayfasi({super.key, required this.sepet});

  @override
  Widget build(BuildContext context) {
    double toplam = sepet.fold(0, (sum, item) => sum + item.fiyat);

    return Scaffold(
      appBar: AppBar(title: const Text('My Cart', style: TextStyle(color: Colors.black)), backgroundColor: Colors.white, elevation: 0, leading: const BackButton(color: Colors.black)),
      body: sepet.isEmpty 
          ? const Center(child: Text('Your cart is empty :(')) 
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: sepet.length,
                    itemBuilder: (context, index) {
                      final u = sepet[index];
                      return ListTile(
                        leading: Image.network(u.resimUrl, width: 50),
                        title: Text(u.isim),
                        subtitle: Text('\$${u.fiyat}'),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('\$${toplam.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {}, 
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: const Size(double.infinity, 50)),
                        child: const Text('Checkout', style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}