import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgrencilerRepository extends ChangeNotifier {
  final ogrenciler = [
    Ogrenci('ali', 'soyad', 12, 'erkek'),
    Ogrenci('ayşe', 'soyad', 12, 'kadın'),
    // Ogrenci('ali', 'soyad', 12, 'erkek'),
    // Ogrenci('ali', 'soyad', 12, 'erkek'),
    // Ogrenci('ali', 'soyad', 12, 'erkek'),
  ];
  final Set<Ogrenci> sevdiklerim = {};
  void sev(Ogrenci ogrenci, bool seviyorMuyum) {
    if (seviyorMuyum) {
      sevdiklerim.add(ogrenci);
    } else {
      sevdiklerim.remove(ogrenci);
    }
    notifyListeners();
  }

  bool seviyorMuyum(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }
}

final ogrencilerProvider = ChangeNotifierProvider(((ref) {
  return OgrencilerRepository();
}));

class Ogrenci {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogrenci(
    this.ad,
    this.soyad,
    this.yas,
    this.cinsiyet,
  );
}
