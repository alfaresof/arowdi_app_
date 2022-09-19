import 'package:flutter/material.dart';

import 'color.dart';

class button_back extends StatelessWidget {
  const button_back({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            style: ButtonStyle(
                backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    )
                )
            ),

            child: Text(
              '  العودة  ',
              style: TextStyle(fontFamily: 'kufam', fontSize: 22,color:orange_color ),
            ),
          ),

        ]
    );
  }
}
