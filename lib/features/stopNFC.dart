



import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfcapp/features/toastMaker.dart';

void stopNFCReading(context) async {
  print("Stop function is tapped");
  try {
    bool isAvailable = await NfcManager.instance.isAvailable();

    //We first check if NFC is available on the device.
    if (isAvailable) {
      debugPrint('NFC is available.');

      NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        debugPrint('NFC is stopped');
      });


    } else {
      debugPrint('NFC not available.');
    }

    toastMaker(context,"NFC is not scanning anymore!",Colors.white);
  } catch (e) {
    debugPrint('Error reading NFC: $e');
  }
}