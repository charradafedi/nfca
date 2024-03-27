import 'package:flutter/material.dart';

import '../features/emulateNFC.dart';
import '../models/Tag.dart';



tagWidget(context,size,type,Tag tag){
  return InkWell(
      child:Container(padding: EdgeInsets.all(size.width*0.1),
      width: size.width*0.9,
      height: size.width*0.3,
      child:Card(elevation: 4,
      child: Row(children: [


        Container(width: size.width*0.13,height: size.width*0.13,
          margin: EdgeInsets.only(right:size.width*0.08 ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/tag.jpg"),
              fit: BoxFit.fill,
            ),
          ),),


        SizedBox(width: size.width*0.4,
          child: Text(tag.id),
        )

        //
      ],),
    )
  ),
  onTap: (){emulateNFC(context, tag.value);},
  );
}