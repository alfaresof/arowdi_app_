import 'package:arowdi_app/back_end/bahrs/findbahr.dart';



class allbahrs{

//******************** بداية الطويل *******************

  static List tawwel_n (List<String> shatr ){//not finish
    if (shatr[1].length > 24){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false, false, false],//first
        [true, false, false, false, true],//sec
        [true, true, false, false, false],//thir
        [true, false, false, false, true]
      ],//fourth
      [
        [true, true, false, false, false],//first
        [true, false, false, false, true],//sec
        [true, true, false, false, false],
        [true, false, false, false, true]
      ],
    ];
    List<int> _taf = [2,3,2,3];
    List<List<List<int>>> _result = [[[0],[0],[0],[0]],[[0],[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }// بحر الطويل
//******************** نهاية الطويل *******************


//******************** بداية البسيط *******************

  static List basset_n (List<String> shatr ){
    if (shatr[1].length > 24){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [[true, true, true, false, false],//first
        [true, true, false],//sec
        [true, true, true, false, false],//thir
        [false, true, true]],//fourth
      [[true, true, true, false, false],//first
        [true, true, false],//sec
        [true, true, true, false, false],
        [false,true,true]],
    ];
    List<int> _taf = [6,1,6,1];
    List<List<List<int>>> _result = [[[0],[0],[0],[0]],[[0],[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر البسيط الطبيعي


  static List basset_m ( List<String> shatr){
    if (shatr[1].length > 17){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [[true, true, true, false, false],
        [true, false, false],
        [true, false, false, false, false]],
      [[true, true, true, false, false],
        [true, false, false],
        [true, false, false, false, false]],
    ];
    List<int> _taf = [6,1,2];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر مجزوء البسيط
//******************** نهاية البسيط  *******************

//******************** بداية الكامل *******************
  static List kamel_n (List<String> shatr ){
    if (shatr[1].length > 21){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, false, false, false, false, false, false, false, false],
        [true, true, true, true, false, true, false, false, false, false]//sec
      ],
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, false, false, false, false, false, false, false, false],//sec
        [true, true, false, false, false, true, false, false, false, false]
      ],
    ];
    List<int> _taf = [7,7,7];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر الكامل العادي

  static List kamel_m (List<String> shatr ){
    if (shatr[1].length > 14){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, true, true, false, false, true, true, true, true]
      ],
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, true, true, false, false, true, true, true, true]//sec

      ],
    ];
    List<int> _taf = [7,7];
    List<List<List<int>>> _result = [[[0],[0]],[[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر الكامل المجزوء
//******************** نهاية الكامل *******************

  //******************** بداية الوافر  *******************
  static List wafer_n (List<String> shatr ){
    if (shatr[1].length > 19){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false],//first
        [true, true, false],
        [true, false, false, false, false]//sec
      ],
      [
        [true, true, false],//first
        [true, true, false],//sec
        [true, false, false, false, false]
      ],
    ];
    List<int> _taf = [5,5,2];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر الوافر العادي

  static List wafer_m (List<String> shatr ){
    if (shatr[1].length > 14){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false],//first
        [true, false, false]
      ],
      [
        [true, true, false],//first
        [true, true, false]//sec

      ],
    ];
    List<int> _taf = [5,5];
    List<List<List<int>>> _result = [[[0],[0]],[[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر الوافر المجزوء

//******************** نهاية الوافر *******************

  //******************** بداية الخفيف  *******************
  static List khafef_n (List<String> shatr ){
    if (shatr[1].length > 21){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, true, false, false],
        [true, true, false, true, false, false, false, false, false, true]//sec
      ],
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, true, false, false],//sec
        [true, true, false, true, false, false, false, false, false, true]
      ],
    ];
    List<int> _taf = [0,6,0];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر الخفيف العادي

  static List khafef_m (List<String> shatr ){
    if (shatr[1].length > 14){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, false, false, false]
      ],
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, false, false, false]//sec

      ],
    ];
    List<int> _taf = [0,6];
    List<List<List<int>>> _result = [[[0],[0]],[[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر الخفيف المجزوء

//******************** نهاية الخفيف *******************


  //******************** بداية الرمل  *******************
  static List ramal_n (List<String> shatr ){
    if (shatr[1].length > 21){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, false, false, false, false, false, false, false, false],
        [true, true, true, true, true, true, false, false, false, false]//sec
      ],
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, false, false, false, false, false, false, false, false],//sec
        [true, true, true, true, true, true, false, false, false, false]
      ],
    ];
    List<int> _taf = [0,0,0];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر الخفيف العادي

  static List ramal_m (List<String> shatr ){
    if (shatr[1].length > 14){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, true, true, false, false, true, true, false, false]
      ],
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, true, true, false, false, true, true, false, false]//sec

      ],
    ];
    List<int> _taf = [0,0];
    List<List<List<int>>> _result = [[[0],[0]],[[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر الرمل المجزوء

//******************** نهاية الرمل *******************







  //******************** بداية المتقارب  *******************
  static List motokareb_n (List<String> shatr ){
    if (shatr[1].length > 20){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false, false, false],//first
        [true, true, false, false, false],//first
        [true, true, false, false, false],
        [true, true, true, true, true]
      ],
      [
        [true, true, false, false, false],//first
        [true, true, false, false, false],//first
        [true, true, false, false, false],
        [true, true, true, true, true]
      ],
    ];
    List<int> _taf = [2,2,2,2];
    List<List<List<int>>> _result = [[[0],[0],[0],[0]],[[0],[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر المتقارب العادي

//******************** نهاية المتقارب *******************



  //******************** بداية المنسرح  *******************
  static List monsareh_n (List<String> shatr ){
    if (shatr[1].length > 21){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, true, true, false],//first
        [true, true],//first
        [true, true, false, false, true]
      ],
      [
        [true, true, true, true, false],//first
        [true, true],//first
        [true, true, false, false, true]
      ],
    ];
    List<int> _taf = [6,4,6];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر المنسرح العادي

//******************** نهاية المنسرح *******************


  //******************** بداية السريع  *******************
  static List sareeh_n (List<String> shatr ){
    if (shatr[1].length > 19){
      return [-1];
    }

    List<List<List<bool>>> _bool = [
      [
        [true, true, true, true, false],//first
        [true, true, true, true, false],//first
        [true, true, true]
      ],
      [
        [true, true, true, true, false],//first
        [true, true, true, true, false],//first
        [true, true, true]
      ],
    ];
    List<int> _taf = [6,6,1];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر المنسرح العادي

//******************** نهاية السريع *******************



  //******************** بداية المقتضب  *******************
  static List moktateb_n (List<String> shatr ){
    if (shatr[1].length > 12){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, false, false],//first
        [true, false, false],//first
      ],
      [
        [true, false, false],//first
        [true, false, false],//first
      ],
    ];
    List<int> _taf = [1,5];
    List<List<List<int>>> _result = [[[0],[0]],[[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر لمجتث العادي

//******************** نهاية المقتضب *******************

//******************** بداية المجتث  *******************
  static List mojtath_n (List<String> shatr ){
    if (shatr[1].length > 14){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, true, false, false],//first
        [true, true, false, false, false, false, false, false, false, true],//first
      ],
      [
        [true, true, true, false, false],//first
        [true, true, false, false, false, false, false, false, false, true],//first
      ],
    ];
    List<int> _taf = [6,0];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر لمجتث العادي

//******************** نهاية المجتث *******************

//******************** بداية المحدث  *******************
  static List mohdath_n (List<String> shatr ){
    if (shatr[1].length > 20){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, true],//first
        [true, true, true],//first
        [true, true, true],//first
        [true, true, true],//first
      ],
      [
        [true, true, true],//first
        [true, true, true],//first
        [true, true, true],//first
        [true, true, true],//first

      ],
    ];
    List<int> _taf = [1,1,1,1];
    List<List<List<int>>> _result = [[[0],[0],[0],[0]],[[0],[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر المحدث العادي

//******************** نهاية المحدث *******************

//******************** بداية المضارع  *******************
  static List modareh_n (List<String> shatr ){
    if (shatr[1].length > 13){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [false, false, false, true, false],//first
        [true, false, false, false, false, false, false, false, false, false]
      ],
      [
        [false, false, false, true, false],//first
        [true, false, false, false, false, false, false, false, false, false]
      ],
    ];
    List<int> _taf = [3,0];
    List<List<List<int>>> _result = [[[0],[0]],[[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر المضارع العادي

//******************** نهاية المضارع *******************


  //******************** بداية الرجز  *******************
  static List rajaz_n (List<String> shatr ){
    if (shatr[1].length > 21){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, true, true, false],//first
        [true, true, true, true, false],
        [true, true, true, true, true]//sec
      ],
      [
        [true, true, true, true, false],//first
        [true, true, true, true, false],
        [true, true, true, true, true]//sec
      ],
    ];
    List<int> _taf = [6,6,6];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر الرجز العادي

//******************** نهاية الرجز *******************



  //******************** بداية المديد  *******************
  static List maded_n (List<String> shatr ){
    if (shatr[1].length > 19){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, false],
        [true, true, true, true, true, true, false, false, true, false]//sec
      ],
      [
        [true, true, false, false, false, false, false, false, false, false],//first
        [true, true, false],//sec
        [true, true, true, true, true, true, false, false, true, false]
      ],
    ];
    List<int> _taf = [0,1,0];
    List<List<List<int>>> _result = [[[0],[0],[0]],[[0],[0],[0]]];

    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];
  }//بحر المديد العادي

//******************** نهاية المديد *******************

  //******************** بداية الهزج *******************

  static List hazj_n (List<String> shatr ){
    if (shatr[1].length > 14){
      return [-1];
    }
    List<List<List<bool>>> _bool = [
      [[true, false, false, true, false],//first
        [true, false, false, true, false]//sec
        ],
      [[true, false, false, true, false],//first
        [true, false, false, true, false]//sec
        ],
    ];
    List<int> _taf = [3,3];
    List<List<List<int>>> _result = [[[0],[0]],[[0],[0]]];
    print('res');
    List res = findit.findbahrso(_bool, _taf, _result, shatr);
    print(res);
    if(res[0]!= -1) {
      return res;
    }
    return [-1];

  }//بحر الهزج

//******************** نهاية الهزج *******************





}
