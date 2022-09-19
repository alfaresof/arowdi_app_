import '../taffeelat/MaTaffelat.dart';

class findit {


  static List findbahrso(List<List<List<bool>>> bool_bah, List<int> taf,
      List<List<List<int>>> result_of_bahrs, List<String> shatr) {
    int starts = 0;
    for (int i = 0; i < 2; i++) {
      starts = 0;
      for (int j = 0; j < taf.length; j++) {


        result_of_bahrs[i][j] = MaTaffelt().find(bool_bah[i][j], shatr[i], starts, taf[j]);
        starts +=  result_of_bahrs[i][j][0];

        if (result_of_bahrs[i][j][0] == -1) {
          return [-1];
        }

      }
    }

    return result_of_bahrs;
  }
}


// print('starts');
// print(starts);
// print("object");
// print(result_of_bahrs[i][j]);
// print("hoho");
// print(result_of_bahrs[i][j]);
// print("hoho");
// print(result_of_bahrs[i][j][0]);