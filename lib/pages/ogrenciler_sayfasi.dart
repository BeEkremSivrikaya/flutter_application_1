import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/repository/ogrenciler_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgrencilerSayfasi extends ConsumerWidget {
  const OgrencilerSayfasi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black54,
        title: const Text('Ogrenciler'),
      ),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 33.0, vertical: 33.0),
                child:
                    Text('${ogrencilerRepository.ogrenciler.length} ogrenci'),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => OgrenciSatiri(
                      ogrencilerRepository.ogrenciler[index],
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: ogrencilerRepository.ogrenciler.length),
          ),
        ],
      ),
    );
  }
}

class OgrenciSatiri extends ConsumerWidget {
  final Ogrenci ogrenci;

  const OgrenciSatiri(
    this.ogrenci, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool seviyorMuyum = ref.watch(ogrencilerProvider).seviyorMuyum(ogrenci);
    return ListTile(
      title: Text(ogrenci.ad + ' ' + ogrenci.soyad),
      leading: Text(ogrenci.cinsiyet == 'erkek' ? '👦' : '👩'),
      trailing: IconButton(
        onPressed: () {
          ref.read(ogrencilerProvider).sev(ogrenci, !seviyorMuyum);
        },
        icon: Icon(seviyorMuyum ? Icons.favorite : Icons.favorite_border),
      ),
    );
  }
}
