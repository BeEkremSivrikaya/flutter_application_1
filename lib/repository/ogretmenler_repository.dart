import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgretmenlerRepository extends ChangeNotifier {
  List ogretmenler = [
    Ogretmen('faruk', 'soyad', 21, 'erkek'),
    Ogretmen('semiha', 'soyad', 22, 'kadın'),
    // Ogrenci('ali', 'soyad', 12, 'erkek'),
    // Ogrenci('ali', 'soyad', 12, 'erkek'),
    // Ogrenci('ali', 'soyad', 12, 'erkek'),
  ];
}

final ogretmenlerProvider = ChangeNotifierProvider((ref) {
  return OgretmenlerRepository();
});

class Ogretmen {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(
    this.ad,
    this.soyad,
    this.yas,
    this.cinsiyet,
  );
}
