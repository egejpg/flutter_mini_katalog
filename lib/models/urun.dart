// --- 1. Ürün Modeli ---
class Urun {
  final int id;
  final String isim;
  final String aciklama;
  final double fiyat;
  final String resimUrl;

  Urun({
    required this.id,
    required this.isim,
    required this.aciklama,
    required this.fiyat,
    required this.resimUrl,
  });

  // Burda isimleri artık api'den gelen title ile alıyoruz 
  factory Urun.fromJson(Map<String, dynamic> json) {
    return Urun(
      id: json['id'],
      isim: json['title'], 
      aciklama: json['description'],
      fiyat: (json['price'] as num).toDouble(), 
      resimUrl: json['image'],
    );
  }
}