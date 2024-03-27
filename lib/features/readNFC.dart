


import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../constants.dart';

void startNFCReading() async {
  try {
    bool isAvailable = await NfcManager.instance.isAvailable();

    //We first check if NFC is available on the device.
    if (isAvailable) {
      //If NFC is available, start an NFC session and listen for NFC tags to be discovered.
      NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          // Process NFC tag, When an NFC tag is discovered, print its data to the console.
          //debugPrint('NFC Tag Detected: ${tag.data}');
          debugPrint('NFC Tag iso: ${tag.data["isodep"]["identifier"]}');
          box.write("newTagID", tag.data["isodep"]["identifier"]);
        },
      );
    } else {
      debugPrint('NFC not available.');
    }
  } catch (e) {
    debugPrint('Error reading NFC: $e');
  }
}
