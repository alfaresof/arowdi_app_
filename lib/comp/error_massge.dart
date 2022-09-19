

import 'package:arowdi_app/comp/text.dart';
import 'package:flutter/material.dart';

import 'color.dart';

class error_massages{
  SnackBar error_massage(String massage){
    return
      SnackBar(
        content: Container(
          padding: EdgeInsets.all(12),

          height: 70,
          decoration: BoxDecoration(color: orange_color,borderRadius: BorderRadius.circular(65)),

          child:black_text(text: "$massage",),

        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      );

  }

}


