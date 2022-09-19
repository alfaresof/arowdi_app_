

import 'package:arowdi_app/back_end/search.dart';
import 'package:arowdi_app/back_end/bahrs/all_bahrs.dart';
import 'package:arowdi_app/back_end/taffeelat/MaTaffelat.dart';
class maino{


     List<List> mainos(String A, String B){
       print("object");
    String first = search().searchn(A,false);
    String second = search().searchn(B,false);
    List<String> res = [first,second];
    print(first);
    print(second);
    List<List> f = [

      allbahrs.basset_n(res),
      allbahrs.basset_m(res),
      allbahrs.hazj_n(res),
      allbahrs.kamel_n(res),
      allbahrs.kamel_m(res),
      allbahrs.khafef_n(res),
      allbahrs.khafef_m(res),
      allbahrs.maded_n(res),
      allbahrs.modareh_n(res),
      allbahrs.mohdath_n(res),
      allbahrs.mojtath_n(res),
      allbahrs.moktateb_n(res),
      allbahrs.monsareh_n(res),
      allbahrs.motokareb_n(res),
      allbahrs.rajaz_n(res),
      allbahrs.ramal_n(res),
      allbahrs.ramal_m(res),
      allbahrs.sareeh_n(res),
      allbahrs.tawwel_n(res),
      allbahrs.wafer_n(res),
      allbahrs.wafer_m(res)

    ];
    List<String> bahrso = [
      "بحر البسيط",
      "مجزوء البسيط",
      "الهزج",
      "الكامل",
      "مجزوء الكامل",
      "الخفيف",
      "مجزوء الخفيف",
      "المديد",
      "المضارع",
      "المحدث",
      "المجتث",
      "المقتضب",
      "المنسرح",
      "المتقارب",
      "الرجز",
      "الرمل",
      "مجزوء الرمل",
      "السريع",
      "الطويل",
      "الوافر",
      "مجزوء الوافر",

    ];

       List<List<String>> WTaffelat = [
         ["فاعلاتن", "فعلاتن", "فاعلا", "فعلا", "فاعلات", "فعلاتْ", "فاعلاتن", "فعلاتن", "فاعل", "فاعلْتِنْ"],//faaelaton 0
         ["فاعلن","فعلن","فاعل"],//faelon 1
         ["فعولن", "فعولُ", "فعو", "فع", "فعولْ"],//faoolon 2
         ["مفاعيلن","مفاعي","مفاعيل","مفاعيلُ","مفاعلن"],//mafaeelon 3
         ["مفعولات","فاعلان"],//mafolato 4
         ["مفاعلتن","مفاعلْتنْ","مفاعلْ"],//mofaalaton 5
         ["مستفعلن","متفعلن","مستعلن","متعلن","مستفعلْ"],//mostafelon 6
         ["متفاعلن", "متْفاعلُ", "متفاعلْ", "متْفاعلنْ", "متفا", "متْفا", "متفاعلاتن", "متْفاعلاتن", "متفاعلان", "متْفاعلان"]//motafaelon 7
       ];
    List<List> resulte = [];
    print(f);

    for (int i =0 ; i<f.length; i++){
      if(f[i][0] != -1){
        print(bahrso[i]);
        print(f[i]);
        print(f[i][0][0][3]);
        print('before it');
        f[i][0][0][3] = i;
        f[i][0][1][3] = i;
        print(f[i][1][0][3]);
        print(bahrso[f[i][0][0][3]]);
        print(WTaffelat[f[i][0][1][1]][f[i][0][1][2]]);
        print('after it');
        print(f[i]);
        List taf = [] ;
        print('some');
        print(f[i][0].length);

        for(int j =0; j < f[i][0].length ; j++){
          print(WTaffelat[f[i][0][j][1]][f[i][0][j][2]]);
          print(WTaffelat[f[i][1][j][1]][f[i][1][j][2]]);
          taf.add(WTaffelat[f[i][0][j][1]][f[i][0][j][2]]);

        }
        for(int j =0; j < f[i][0].length ; j++){
          print(WTaffelat[f[i][1][j][1]][f[i][1][j][2]]);
          taf.add(WTaffelat[f[i][1][j][1]][f[i][1][j][2]]);

        }

        print(taf);
        print(bahrso[f[i][0][0][3]]);
        taf.add(bahrso[f[i][0][0][3]]);
        resulte.add(taf);
        print(resulte);
        
      }

    }
    print("before return");
    print(resulte);
    return resulte;



  }
}


