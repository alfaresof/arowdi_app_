

import 'package:arowdi_app/comp/color.dart';
import 'package:arowdi_app/screen/home.dart';
import 'package:flutter/material.dart';

class welcome_page extends StatefulWidget {
  const welcome_page({Key? key}) : super(key: key);

  @override
  State<welcome_page> createState() => _welcome_pageState();
}

class _welcome_pageState extends State<welcome_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            child:Image.asset('assets/desert.jpg',     fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,),
    ),
        Container(

        decoration: BoxDecoration(
         color:  Color.fromRGBO(0, 0, 0, 0.85),

    ),),

      Center(
      child: Column(children: [
        SizedBox(height: 100,),
       Text('العروضي', style: TextStyle(color: Colors.white,fontFamily: 'Kufam',fontSize: 50),),
       Text('لوزن الشعر', style: TextStyle(color: Color.fromRGBO(202, 131, 47, 1),fontFamily: 'kufam',fontSize: 25),),
        SizedBox(height: 350,),
       ElevatedButton(
        onPressed: (){
         Navigator.of(context).push(
         MaterialPageRoute(builder: (context) => home( selected: 1))
           );
         },

        style:  ButtonStyle(
        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
         )
         )
         ),

           child: Text(
          '      ابدأ      ',
         style: TextStyle(fontFamily: 'kufam', fontSize: 30,color: orange_color),
           ),
        ),



        ],


      ),

      )]));
  }
}
