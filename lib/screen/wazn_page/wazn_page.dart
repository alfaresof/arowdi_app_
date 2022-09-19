

import 'package:arowdi_app/comp/color.dart';
import 'package:flutter/material.dart';
import 'package:arowdi_app/comp/input_deco.dart';
import '../../back_end/maino.dart';
import '../../back_end/convert.dart';
import '../../comp/text.dart';
import '../result.dart';
import 'package:arowdi_app/comp/error_massge.dart';
class wazn_page extends StatefulWidget {
  const wazn_page({Key? key}) : super(key: key);

  @override
  State<wazn_page> createState() => _wazn_pageState();
}

class _wazn_pageState extends State<wazn_page> {
  String first = "",second = "",
      first_arrowdi = "", second_arrowdi = "",
  first_shatr="",second_shatr = "";
  final _formKey = GlobalKey<FormState>();
  inputa input_decoration = inputa();
  @override
  Widget build(BuildContext context) {
    void _showresult(String firs,String sec){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>  result(first: firs, second: sec,id: -1,)),
      );

    }

    return Scaffold(
      backgroundColor: black_color,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 100,),
                big_text(text: "محرك العروض"),
                SizedBox(height: 30,),
                orange_text_small(text: first_arrowdi.replaceAll('1', '/').split('').reversed.join()),
                orange_text_small(text: first),
                SizedBox(height: 10,),

                SizedBox(
                  width: 300,

                  child: TextFormField(
                    validator: ((val) =>
                    val!.isEmpty ? "أدخل الشطر الأول" : null),
                    onChanged: (val){
                      setState(() {
                        first_shatr = val;
                        first_arrowdi = search().converter_method(val,false);
                        first = search().converter_method(val, true);

                      } );
                    },
                    textAlign: TextAlign.center,
                    decoration:  input_decoration.input_decoration("أدخل الشطر الأول"),
                  ),
                ),
                SizedBox(height: 30,),
                orange_text_small(text: second_arrowdi.replaceAll('1', '/').split('').reversed.join()),
                orange_text_small(text: second),
                SizedBox(height: 10,),
                SizedBox(
                  width: 300,

                  child: TextFormField(
                    validator: ((val) =>
                    val!.isEmpty ? "أدخل الشطر الثاني" : null),
                    onChanged: (val){
                      setState(() {
                        second_shatr = val;
                        second_arrowdi = search().converter_method(val,false);
                        second = search().converter_method(val, true);

                      } );
                    },

                    textAlign: TextAlign.center,
                    decoration: input_decoration.input_decoration("أدخل الشطر الثاني"),


                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      List<List> results;
                      results = maino().mainos(first_shatr, second_shatr);
                      // print("this is results");
                      // print(results);
                      // print("=====================================${results.isNotEmpty}");
                      if(results.isNotEmpty){
                      _showresult(first_shatr, second_shatr);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          error_massages().error_massage("لم يتم العثور على البحر \n تحقق من البيت المدخل")
                            // SnackBar(
                            //   content: Container(
                            //     padding: EdgeInsets.all(12),
                            //
                            //     height: 70,
                            //     decoration: BoxDecoration(color: orange_color,borderRadius: BorderRadius.circular(65)),
                            //
                            //     child:black_text(text: "لم يتم العثور على البحر \n تحقق من البيت المدخل",),
                            //
                            //   ),
                            //   behavior: SnackBarBehavior.floating,
                            //   backgroundColor: Colors.transparent,
                            //   elevation: 0,
                            // )
                        );
                      }
                    }

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
                    'أوجد الوزن',
                    style: TextStyle(fontFamily: 'kufam', fontSize: 20,color: black_color),
                  ),
                ),

              ],
            ),
          ),
        ),


      ),
    );
  }
}
