import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nfc_host_card_emulation/nfc_host_card_emulation.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfcapp/features/toastMaker.dart';

//
//
emulateNFC(context,_tag)async{
  final nfcState = await NfcHce.checkDeviceNfcState();
  toastMaker(context, "Emulator has been launched",Colors.green);
  await NfcHce.init(
    // AID that match at least one aid-filter in apduservice.xml.
    // In my case it is A000DADADADADA.
    aid: Uint8List.fromList(_tag),

    // next parameter determines whether APDU responses from the ports
    // on which the connection occurred will be deleted.
    // If `true`, responses will be deleted, otherwise won't.
    permanentApduResponses: true,

    // next parameter determines whether APDU commands received on ports
    // to which there are no responses will be added to the stream.
    // If `true`, command won't be added, otherwise will.
    listenOnlyConfiguredPorts: false,
  );


  NfcHce.stream.listen((command) {
    toastMaker(context, command.toString(),Colors.black);
    // some action here
  });

}


///--------------------------
emulatorShuttDow()async{

}