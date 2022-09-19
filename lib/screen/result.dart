import 'package:arowdi_app/back_end/maino.dart';
import 'package:arowdi_app/comp/color.dart';
import 'package:arowdi_app/comp/text.dart';
import 'package:flutter/material.dart';

import '../back_end/convert.dart';
import '../comp/error_massge.dart';
import '../sql/sql.dart';
import 'home.dart';



class result extends StatelessWidget {
  final String first,second;
  final int id;
  const result({Key? key, required this.first, required this.second, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String saved_delete_button = "";
    if(id == -1){
      saved_delete_button = "حفظ";
    }else{
      saved_delete_button = "حذف";
    }
    List<List> results;
    String A_A=search().converter_method(first, false),A_f=search().converter_method(first, true);
    String B_a=search().converter_method(second, false),B_f=search().converter_method(second, true);
    results = main_search_class().main_search(first, second);
    return Scaffold(
      backgroundColor: black_color,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(

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
                  ElevatedButton(
                    onPressed: () async{
                      if(id == -1) {

                        int response = await sqldb().insertdata(
                            'INSERT INTO poets(first,second) VALUES("${first}","${second}")');
                        print(response);

                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> home(selected: 1,)), (route) => false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            error_massages().error_massage("تم حفظ البيت! \n توجه إلى أبياتي السابقة")


                            // SnackBar(
                            //   content: Container(
                            //     padding: EdgeInsets.all(12),
                            //
                            //     height: 70,
                            //     decoration: BoxDecoration(color: orange_color,borderRadius: BorderRadius.circular(65)),
                            //
                            //     child:black_text(text: "تم حفظ البيت! \n توجه إلى أبياتي السابقة",),
                            //
                            //   ),
                            //   behavior: SnackBarBehavior.floating,
                            //   backgroundColor: Colors.transparent,
                            //   elevation: 0,
                            // )
                        );
                      }else{
                        await sqldb().deletedata('DELETE FROM poets WHERE id = ${id}');
                        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> home(selected: 0,)), (route) => false);
                        ScaffoldMessenger.of(context).showSnackBar(
                            error_massages().error_massage("تم حذف البيت")
                            // SnackBar(
                            //   content: Container(
                            //     padding: EdgeInsets.all(12),
                            //
                            //     height: 70,
                            //     decoration: BoxDecoration(color: orange_color,borderRadius: BorderRadius.circular(65)),
                            //
                            //     child:black_text(text: "تم حذف البيت",),
                            //
                            //   ),
                            //   behavior: SnackBarBehavior.floating,
                            //   backgroundColor: Colors.transparent,
                            //   elevation: 0,
                            // )
                        );
                      }
                    },

                    style: ButtonStyle(
                        backgroundColor:  MaterialStateProperty.all<Color>(orange_color),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            )
                        )
                    ),

                    child: Text(
                      '   ${saved_delete_button}   ',
                      style: TextStyle(fontFamily: 'kufam', fontSize: 22,color:Colors.white ),
                    ),
                  ),

                ],

              ),
            ),


           orange_text(text: "نتيجة البحث") ,
            Expanded(
              child: ListView.builder(

                  itemCount: results.length,
                  itemBuilder: (BuildContext context, int index) {
                    print(results);
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(

                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35),


                        ),
                        child: Column(
                          children: [

                            Text(
                              '${results[index][results[index].length-1]}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: black_color, fontFamily: 'kufam', fontSize: 40),
                            ),

                            SizedBox(
                              height: 10,
                            ),
                            orange_text_small(text: '${first} \n ${A_f}  '),


                            black_text(text:'${results[index].sublist(0,((results[index].length-1)/2).toInt())}'.replaceAll('[', '').replaceAll(']', '').replaceAll(',', ''),
                            ),

                            Divider( thickness: 1,color: black_color,),
                            orange_text_small(text: '${second} \n ${B_f}  '),

                            black_text(text:'${results[index].sublist(((results[index].length-1)/2).toInt(),results[index].length-1)}'.replaceAll('[', '').replaceAll(']', '').replaceAll(',', ''),
                            ),


                          ],
                        ),
                      ),
                    );}
              ),
            ),

          ],

        ),
      ),



    );
  }
}
