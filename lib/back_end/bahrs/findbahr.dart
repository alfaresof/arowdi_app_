import '../taffeelat/Taffelat_search.dart';

class findit {
  /*
  * دالة البحث ومقارنة التفعيلات مختلفة عن هذه الدالة
   هذه الدالة تبحث في الدالة السابقة ثم ترجع نتائج البحث بحسب البحر*
  * */

  static List findbahrso(List<List<List<bool>>> bool_bah, List<int> taf,// we take 3 nasted list  1 = for bahr , 2= for shatr , 3 = for taffelah, list taf = which taffelah we will use
      List<List<List<int>>> result_of_bahrs, List<String> shatr) {
    int starts = 0;
    for (int i = 0; i < 2; i++) {// for search in two shatr
      starts = 0;
      for (int j = 0; j < taf.length; j++) {// for search in taffelah


        result_of_bahrs[i][j] = Taffelat_search().find(bool_bah[i][j], shatr[i], starts, taf[j]);// use it to search in taffelah
        starts +=  result_of_bahrs[i][j][0];//change start point for next taffelah

        if (result_of_bahrs[i][j][0] == -1) {// if results not found
          return [-1];
        }

      }
    }

    return result_of_bahrs;
  }
}

