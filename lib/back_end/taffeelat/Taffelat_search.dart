class Taffelat_search{

  List<List<String>> Taffelat = [
    ["1011010", "111010", "10110", "1110", "101100", "11100", "10110100", "1110100", "1010", "101010"],//faaelaton 0
    ["10110","1110","1010"],//faelon 1
    ["11010", "1101", "110", "10", "1100"],//faoolon 2
    ["1101010","11010","110100","110101","110110"],//mafaeelon 3
    ["1010101","101101"],//mafolato 4
    ["1101110","1101010","11010"],//mofaalaton 5
    ["1010110","110110","101110","11110","101010"],//mostafelon 6
    ["1110110", "1010110", "111010", "101010", "1110", "1010", "111011010", "101011010", "11101100", "10101100"]//motafaelon 7
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
  List<int> results = [0,0,0,0];
  List<int> find (List<bool> bol,String shatr, int start,int which_taffelah){
    if(0 <= start){//to start search
      for (int i = 0; i < Taffelat[which_taffelah].length; i++) {//loop search
        if (bol[i] == true) {// premmesion to use taffelah
          if(start+Taffelat[which_taffelah][i].length <= shatr.length){//cheack if we can make sub string or shart was end
            if (Taffelat[which_taffelah][i] == shatr.substring(start, start + Taffelat[which_taffelah][i].length)) {// check for تطابق
              //result of search
              results[0] = Taffelat[which_taffelah][i].length;
              results[1] = which_taffelah;
              results[2] = i;
              return results;
            }}
        }
      }}
    results [0] = -1;
    return results;
  }

  }




