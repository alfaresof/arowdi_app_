import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class inputa{

  InputDecoration input_decoration(String a){
  return InputDecoration(
    fillColor: Colors.white,
    prefixIconColor: black_color,
    contentPadding: EdgeInsets.all(8),
    hintStyle:
    TextStyle(color: Colors.black, fontFamily: 'roboto'),

    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0)

    ),
    hintText: '$a',
    filled: true,
  );
  }


}