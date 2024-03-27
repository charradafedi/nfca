

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfcapp/features/toastMaker.dart';

NFCStatuss(context) async {
  try {
    bool isAvailable = await NfcManager.instance.isAvailable();

    //We first check if NFC is available on the device.
    if (isAvailable) {
      debugPrint('NFC is available.');

      toastMaker(context,"NFC is available",Colors.white);
    } else {
      debugPrint('NFC not available.');
      toastMaker(context,"NFC is not available",Colors.red);
    }
  } catch (e) {
    debugPrint('Error reading NFC: $e');
  }
}
