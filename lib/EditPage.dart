import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nfcapp/features/stopNFC.dart';
import 'package:nfcapp/features/toastMaker.dart';

import 'constants.dart';
import 'features/creationDialog.dart';
import 'features/emulateNFC.dart';
import 'features/nfcStatus.dart';
import 'features/readNFC.dart';


class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;

    return Container(padding: EdgeInsets.only(top: h*0.15),
      child:Column(children: [


//======= check NFC status
       InkWell(onTap: (){NFCStatuss(context);},
        child:Container(width: w*0.8,height: h*0.07,margin: EdgeInsets.only(bottom: h*0.02),alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
          child: Text("Check NFC Status",style: TextStyle(color: Colors.white),)
        )),







        //====Read NFC
        InkWell(onTap: (){startNFCReading();},
            child:Container(width: w*0.8,height: h*0.07,margin: EdgeInsets.only(bottom: h*0.02),alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                 child: Text("Start Scanning",style: TextStyle(color: Colors.white),)
            )),





        //====Stop NFC
        InkWell(onTap: (){stopNFCReading(context);},
            child:Container(width: w*0.8,height: h*0.07,margin: EdgeInsets.only(bottom: h*0.02),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Stop Scanning",style: TextStyle(color: Colors.white),)
            )),








        //====Add Tag
        InkWell(onTap: ()async{print(box.read("newTagID"));
          var _tag=box.read('newTagID');
          if(_tag!=null){
            await emulateNFC(context,_tag);
          }
          else {toastMaker(context, "No tag was recently detected", Colors.red);}
          },
            child:Container(width: w*0.8,height: h*0.07,margin: EdgeInsets.only(bottom: h*0.02),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Emulate Tag",style: TextStyle(color: Colors.black),)
            )),








        //====Save Tag
        InkWell(onTap: (){
          var _tag=box.read('newTagID');
          if(_tag!=null){
            createDialog(context,w,_tag);
          }
          else {toastMaker(context, "No tag was recently detected", Colors.red);}

          //saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async => await box.write(/*key:*/ storageKey, /*value:*/ jsonEncode(storageValue));

        //

        },
            child:Container(width: w*0.8,height: h*0.07,margin: EdgeInsets.only(bottom: h*0.02),
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text("Save Tag",style: TextStyle(color: Colors.blue),)
            )),









      ],)
    );
  }
}
