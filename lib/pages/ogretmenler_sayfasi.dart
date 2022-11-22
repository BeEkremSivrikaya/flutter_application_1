import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/repository/ogrenciler_repository.dart';
import 'package:flutter_application_1/repository/ogretmenler_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgretmenlerSayfasi extends ConsumerWidget {
  const OgretmenlerSayfasi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        // backgroundColor: Colors.black54,
        title: const Text('Ogretmenler'),
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
                    Text('${ogretmenlerRepository.ogretmenler.length} ogrenci'),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => OgretmenSatiri(
                      ogretmenlerRepository.ogretmenler[index],
                    ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: ogretmenlerRepository.ogretmenler.length),
          ),
        ],
      ),
    );
  }
}

class OgretmenSatiri extends StatelessWidget {
  final Ogretmen ogretmen;

  const OgretmenSatiri(
    this.ogretmen, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ogretmen.ad + ' ' + ogretmen.soyad),
      leading: Text(ogretmen.cinsiyet == 'erkek' ? '👦' : '👩'),
    );
  }
}
