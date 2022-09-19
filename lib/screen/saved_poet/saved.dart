import 'package:arowdi_app/comp/text.dart';
import 'package:arowdi_app/screen/result.dart';
import 'package:flutter/material.dart';

import '../../comp/color.dart';
import '../../sql/sql.dart';

class saved_poet extends StatelessWidget {
  const saved_poet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Map>> list_poets_sql ( )async{
      List<Map> respoanse = await sqldb().readdata('SELECT * FROM poets');
      print(respoanse);
      return respoanse;
    }
    return Scaffold(
      backgroundColor: black_color,
      body: Column(
          children:[
            SizedBox(height: 60,),
            orange_text(text: "نتائج سابقة"),
            SizedBox(height: 20,),

            FutureBuilder<List<Map>>(
              future: list_poets_sql(),
              builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {

                if(snapshot.hasData&&snapshot.data!.isNotEmpty){

                  return Expanded(
                    child: ListView.builder(

                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {

                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(

                                color: Colors.white,
                                borderRadius: BorderRadius.circular(35),


                              ),
                              child: ListTile(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => result(first: snapshot.data![index]['first'],second:snapshot.data![index]['second'] ,id: snapshot.data![index]['id']),),

                                  );
                                },
                                title: Column(
                                  children: [

                                    black_text(text: '${snapshot.data![index]['first']} '),
                                    black_text(text: '${snapshot.data![index]['second']} '),
                                  ],
                                ),
                              ),
                            ),
                          );}
                    ),
                  );

                }else{
                  return Center(
                    child:
                  white_text(text: "لا يوجد أبيات سابقة"),);
                }

              },),

          ]
      ),
    );
  }
}
