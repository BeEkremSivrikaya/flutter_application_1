import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/mesajlar_sayfasi.dart';
import 'package:flutter_application_1/pages/ogrenciler_sayfasi.dart';
import 'package:flutter_application_1/pages/ogretmenler_sayfasi.dart';
import 'package:flutter_application_1/repository/mesajlar_repository.dart';
import 'package:flutter_application_1/repository/ogrenciler_repository.dart';
import 'package:flutter_application_1/repository/ogretmenler_repository.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnaSayfa extends ConsumerWidget {
  AnaSayfa({super.key, required this.title});

  final String title;
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);
    // final mesajlarRepository = ref.watch(mesajlarProvider);

    return Scaffold(
      // backgroundColor: Colors.black,
      drawer: Drawer(
          // backgroundColor: Colors.blueGrey,
          width: 230,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 123,
                width: 225,
                color: const Color.fromARGB(255, 42, 156, 249),
                child: const SafeArea(child: Text('Öğrenci Adı')),
              ),
              // const SizedBox(
              //   height: 60,
              // ),
              SizedBox(
                height: 360,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        _ogrencilereGit(context);
                      },
                      child: const Text('Öğrenciler'),
                    ),
                    TextButton(
                      onPressed: () {
                        _ogretmenlereGit(context);
                      },
                      child: const Text('Öğretmenler'),
                    ),
                    TextButton(
                      onPressed: () {
                        _mesajlaraGit(context);
                      },
                      child: const Text('Mesajlar'),
                    ),
                  ],
                ),
              ),
            ],
          )),
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                _authService.signOuth();
                Navigator.of(context).pop(context);
              },
              icon: Icon(Icons.logout))
        ],
        // backgroundColor: Colors.black54,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                _ogrencilereGit(context);
              },
              child: Text('${ogrencilerRepository.ogrenciler.length} Öğrenci'),
            ),
            TextButton(
              onPressed: () {
                _ogretmenlereGit(context);
              },
              child:
                  Text('${ogretmenlerRepository.ogretmenler.length} Öğretmen'),
            ),
            TextButton(
              onPressed: () {
                _mesajlaraGit(context);
              },
              child: Text('${ref.watch(yeniMesajSayisiProvider)} yeni mesaj'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _mesajlaraGit(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MesajlarSayfasi(),
    ));
  }

  void _ogretmenlereGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const OgretmenlerSayfasi(),
    ));
  }

  void _ogrencilereGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const OgrencilerSayfasi(),
    ));
  }
}

// class YonlendirWidget extends StatelessWidget {
//   const YonlendirWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => OgrencilerSayfasi(),
//             ));
//           },
//           child: Text('Öğrenciler'),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => OgretmenlerSayfasi(),
//             ));
//           },
//           child: Text('Öğretmenler'),
//         ),
//         TextButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => MesajlarSayfasi(),
//             ));
//           },
//           child: Text(' yeni mesaj'),
//         ),
//       ],
//     );
//   }
// }

// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         // backgroundColor: Colors.blueGrey,
//         width: 230,
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               height: 123,
//               width: 225,
//               color: Color.fromARGB(255, 42, 156, 249),
//               child: SafeArea(child: Text('Öğrenci Adı')),
//             ),
//             // const SizedBox(
//             //   height: 60,
//             // ),
//             SizedBox(
//               height: 360,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => OgrencilerSayfasi(),
//                       ));
//                     },
//                     child: Text('Öğrenciler'),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => OgretmenlerSayfasi(),
//                       ));
//                     },
//                     child: Text('Öğretmenler'),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => MesajlarSayfasi(),
//                       ));
//                     },
//                     child: Text('Mesajlar'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
// }
