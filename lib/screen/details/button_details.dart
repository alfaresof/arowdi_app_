import 'package:flutter/material.dart';

import '../../comp/color.dart';
import 'about.dart';
class button_details extends StatelessWidget {
  final String title;
  final String details;
  const button_details({Key? key, required this.title, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: (() => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => about(title: "$title",details: '''
      ${details}
        ''',),),
      )),
      style:  ButtonStyle(
          backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              )
          )
      ),
      child: Text(
        '$title',
        style: TextStyle(fontFamily: 'kufam', fontSize: 30,color: black_color),
      ),);
  }
}
