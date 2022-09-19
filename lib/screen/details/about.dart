import 'package:arowdi_app/comp/button.dart';
import 'package:arowdi_app/comp/color.dart';
import 'package:arowdi_app/comp/text.dart';
import 'package:flutter/material.dart';
class about extends StatelessWidget {
  final String title;
  final String details;
  const about({Key? key, required this.title, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black_color,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50,),
                button_back(),
                SizedBox(height: 10,),
                orange_text(text: "${title}"),
                SizedBox(height: 20,),
                white_text(text: '''
${details}
                ''')


              ],
            ),
          ),
        ),
      ),
    );
  }
}
