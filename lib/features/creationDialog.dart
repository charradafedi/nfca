



import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/Tag.dart';

createDialog(context,w,_tag){
  // saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async => await box.write(/*key:*/ storageKey, /*value:*/ jsonEncode(storageValue));


  List<Tag>tags=[];


  tagsUpdate(){
    if(box.read("tags")!=null){tags=box.read("tags");}
    else{tags=[];}
  }

  String Alias="";
    return showDialog(
        context: context,
        builder: (dialogContext) {
          tagsUpdate();
          return StatefulBuilder(builder: (stfContext, stfSetState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    20.0,
                  ),
                ),
              ),
              contentPadding: EdgeInsets.only(
                top: 10.0,
              ),
              title: Text(
                "New Tag", textAlign: TextAlign.center,
                style: TextStyle(fontSize: w * 0.04),
              ),
              content: Container(padding: EdgeInsets.all(20),
                  height: w*0.6,
                  child: Column(children: [

                    TextFormField(
                      decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Alias',
                  ),
                      onChanged: (val) {
                       Alias=val.toString();
                      },
                    )


                  ],)
              ),



              actions: [
                TextButton(onPressed: (){
                 try{
                   tags.add(Tag(Alias, _tag));
                   box.write("tags", tags);
                   Navigator.pop(dialogContext);
                 }
                     catch(e){

                     }
                }, child: Text("Create")),


                TextButton(onPressed: (){Navigator.pop(dialogContext);}, child: Text("Cancel")),
              ],
            );
          });
        });
}