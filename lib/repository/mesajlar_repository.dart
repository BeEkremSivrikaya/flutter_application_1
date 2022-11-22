// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MesajlarRepository extends ChangeNotifier {
  final List<Mesaj> mesajlar = [
    Mesaj(
        'merhaba', 'Ali', DateTime.now().subtract(const Duration(minutes: 3))),
    Mesaj('oradamısın', 'Ali',
        DateTime.now().subtract(const Duration(minutes: 2))),
    Mesaj('evet', 'ayşe', DateTime.now().subtract(const Duration(minutes: 1))),
    Mesaj('nasılsın', 'ayşe', DateTime.now()),
  ];
}

final mesajlarProvider = ChangeNotifierProvider(
  (ref) {
    return MesajlarRepository();
  },
);

class YeniMesajSayisi extends StateNotifier<int> {
  YeniMesajSayisi(super.state);

  void sifirla() {
    state = 0;
  }
}

final yeniMesajSayisiProvider = StateNotifierProvider<YeniMesajSayisi, int>(
  (ref) {
    return YeniMesajSayisi(4);
  },
);

class Mesaj {
  String yazi;
  String gonderen;
  DateTime zaman;

  Mesaj(this.yazi, this.gonderen, this.zaman);
}
