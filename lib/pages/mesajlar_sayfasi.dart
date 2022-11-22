import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/repository/mesajlar_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MesajlarSayfasi extends ConsumerStatefulWidget {
  const MesajlarSayfasi({super.key});

  @override
  _MesajlarSayfasiState createState() => _MesajlarSayfasiState();
}

class _MesajlarSayfasiState extends ConsumerState<MesajlarSayfasi> {
  @override
  void initState() {
    Future.delayed(Duration.zero)
        .then((value) => ref.read(yeniMesajSayisiProvider.notifier).sifirla());

    // widget.mesajlarRepository.yeniMesajSayisi = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mesajlarRepository = ref.watch(mesajlarProvider);
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black54,
        title: const Text('Mesajlar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: mesajlarRepository.mesajlar.length,
              itemBuilder: (context, index) {
                return MesajGorunumu(mesajlarRepository
                    .mesajlar[mesajlarRepository.mesajlar.length - index - 1]);
              },
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(23.0))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Gönder'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MesajGorunumu extends StatelessWidget {
  final Mesaj mesaj;
  const MesajGorunumu(
    this.mesaj, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: mesaj.gonderen == 'Ali'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              color: Colors.orange.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: Padding(
            padding: const EdgeInsets.all(23.0),
            child: Text(mesaj.yazi),
          ),
        ),
      ),
    );
  }
}
