import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfcapp/homePage.dart';
import 'package:get_storage/get_storage.dart';
import 'features/readNFC.dart';
import 'landPage.dart';




main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      home: landPage(),
    );
  }
}
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('NFC Reader'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: startNFCReading,
//           child: const Text('Start NFC Reading'),
//         ),
//       ),
//     );
//   }

//}