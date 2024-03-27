import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfcapp/features/nfcStatus.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nfcapp/widgets/tagWidget.dart';
import 'constants.dart';
import 'features/readNFC.dart';
import 'models/Tag.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  bool _available=false;
  var tags=[];
  tagsUpdate(){
    if(box.read("tags")!=null){tags=box.read("tags");}
    else{tags=[];}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _available=false;
   // tags=box.read("tags");
  }

    @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    var h=MediaQuery.of(context).size.height;
    tagsUpdate();

    return Scaffold(
      appBar: AppBar(
       // title: const Text('FCH- Test App'),
      ),

      body:Container(width: w,height: h,
      child:Column(children: [

        Center(child:Text("Exisiting Tags",style: TextStyle(fontSize: w*0.06,color: Colors.blue),)),


       tags.isNotEmpty? Container(width: w,height: h*0.7,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return  tagWidget(context,MediaQuery.of(context).size,"normalTag",tags[index]);

          },
        ))
              :Container(margin: EdgeInsets.only(top: h*0.2),
           child:Center(child:Text("Empty List",style: TextStyle(fontSize: w*0.03,color: Colors.black),))),


      ],))


      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: startNFCReading,
      //     child: const Text('Start NFC Reading'),
      //   ),
      // ),
    );
  }



  ///============

  checkFunction()async{
    bool isAvailable = await NfcManager.instance.isAvailable();
    if(isAvailable){
     setState(() {
       _available=true;
     });
    }
    else {
      setState(() {
        _available=false;
      });
    }
  }


//=======

}

