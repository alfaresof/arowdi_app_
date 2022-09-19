import 'package:ffi/ffi.dart';
import 'package:arowdi_app/back_end/taffeelat/MaTaffelat.dart';
class search{
   String searchn(String bb,bool k_a){

       String shatr = bb;
       shatr = methods.replacea(shatr);
       shatr = shatr.replaceAll('َّ', 'َّ');
       shatr = shatr.replaceAll('ُّ','ُّ');
       shatr = shatr.replaceAll('ِّ','ِّ');
       //shatr = shatr.replaceAll(' ', '');
        print(shatr);
       
       String results = "" ;
       String results_2 = "" ;
       String result_A = "";
        //shatr += "     ";
        shatr = "   " +shatr+"     ";
        print(shatr);
       for (int i = 3; i < shatr.length; i++) {

         if(String.fromCharCode(shatr.codeUnitAt(i))!=' '){


           int a = shatr.codeUnitAt(i);
           int b = shatr.codeUnitAt(i+1);
           int c = shatr.codeUnitAt(i+2);
           int d = shatr.codeUnitAt(i+3);
           int e = shatr.codeUnitAt(i+4);

           if(methods._IsHarf(b)==true&&methods._IsHarf(a)){// اذا لم يكن الحرف متحركا

             if(methods._isAA(a)){// اذا كان الف ممدودة
               results_2 += '10';

               result_A += String.fromCharCode(a);
             }else if (String.fromCharCode(a)=='ا'){ // اذا كان الف
               if(methods._IsItAL(a, b)){// اذا كان ال
                 print('al');
                if(methods.typeof(c)=='1'){// اذا لم تكن ال
                  results_2 += '0';
                  result_A += String.fromCharCode(a) + 'ْ';
                }else if(methods.typeof(d)=='01'){// اذا كان ال شمسية
                  if(i == 3){
                    result_A += 'أ';
                    results_2 += '1';
                  }
                  result_A += String.fromCharCode(c)+'ْ'+String.fromCharCode(c);
                  print('sunny');
                  results_2 += '01';
                  if(methods.typeof(e)=='1'){// اذا رافق الشدّة حركة
                    result_A += String.fromCharCode(e);
                    i+=1;
                  }else{
                    result_A += 'َ';
                  }
                  i+=3;
                }else if(methods.typeof(d)=='1'){// اذا كان ال قمرية
                  if(i == 3){
                    result_A += 'أ';
                    results_2 += '1';
                  }
                  result_A += String.fromCharCode(b)+'ْ'+String.fromCharCode(c)+String.fromCharCode(d);
                  results_2 += '01';
                  i+=3;
                }else{
                  result_A += String.fromCharCode(a)+'ْ';
                  results_2 += '0';
                }
               }else if(String.fromCharCode(shatr.codeUnitAt(i-1))=='و'&& String.fromCharCode(b)==' ') {//اذا كانت الف واو الجماعة
                 i++;
               }else if(methods._IsItAL(c, d)){// اذا كانت ال بعد المد
                  // results_2 += '0';
                  // result_A += String.fromCharCode(a);
               }else if(methods._isConnectAA(shatr.codeUnitAt(i-1), shatr.codeUnitAt(i-2))){// اذا كانت الف موصولة
                if((String.fromCharCode(shatr.codeUnitAt(i-1))== 'ف'||String.fromCharCode(shatr.codeUnitAt(i-1))== 'و') ){

                }else{
                  result_A += String.fromCharCode(b)+'ْ';
                 i++;
                }
               }else{// اذا كانت الألف مداً
                 result_A += String.fromCharCode(a)+'ْ';
                 results_2 += '0';
               }
             }else if(methods._IsItMad(a)&&String.fromCharCode(a)!='ا'){//اذا كان مد غير الألف

               if(methods._IsItAL(c, d)&&String.fromCharCode(b)==' '){// اذا كانت ال بعد المد

               }else if(methods._IsItMad(b)){// اذا كان حرفي مد متتالين
                 result_A += String.fromCharCode(a)+'َ';
                 results_2 += '1';
               }else if(methods._IsHarf(a)&&String.fromCharCode(shatr.codeUnitAt(i-1))==' '){//اعتبار اي حرف أول الكلمة ساكن
                 results_2 += '1';
                 result_A += String.fromCharCode(a)+'َ';
               }else if(methods._IsHarf(b)){// اذا كان حرف المد بدون حرف مد متتالي
                 result_A += String.fromCharCode(a)+'ْ';
                 results_2 += '0';
               }
             }else if(String.fromCharCode(b)=='ا'&&methods.typeof(c)=='10'){
              results_2 += '10';
              result_A += String.fromCharCode(a) + 'ن';
              i+=2;
             }else if(methods._IsItMad(b)&&methods.typeof(c)!='1'){// اعتبار اي حرف لا حركة عليه وبعده مد متحرك
              results_2 += '1';
              result_A += String.fromCharCode(a)+ 'َ';
             }else if(methods._IsHarf(a)&&String.fromCharCode(shatr.codeUnitAt(i-1))==' '){//اعتبار اي حرف أول الكلمة ساكن
               results_2 += '1';
               result_A += String.fromCharCode(a)+'َ';
             }else{// اعتبار اي حرف ساكن مالم يكن من الحالات المذكورة اعلاه

               results_2 += '0';
               result_A += String.fromCharCode(a) +'ْ';
             }


           }else{// اذا كان الحرف مشكل
     if(methods.typeof(shatr.codeUnitAt(i-1))=='1'&&String.fromCharCode(a)=='ه'&&methods.typeof(b)=='1'&& String.fromCharCode(c)==' '){//اذا كانت الهاء التي بعدها حركة وقبلها حركة

       i++;
       results_2 += '10';
      result_A += String.fromCharCode(a)+String.fromCharCode(b)+'ي'; // نحتاج اضافة مد هنا , سيضاف لاحقاً تباً له
     }else if(methods.typeof(b)=='10'){// اذا كان تنوين
       results_2 += methods.typeof(b);
       result_A += String.fromCharCode(a)+'ن';
       if(String.fromCharCode(b)=='ا' &&String.fromCharCode(c)==' '){// اذا كان بعد التنوين الف التنوين
         i++;
       }
       i+=2;
     }else if(methods.typeof(b)=='01'){// اذا كان شدّة
       results_2 += methods.typeof(b);
       result_A += String.fromCharCode(a)+'ْ'+String.fromCharCode(a);
       if(methods.typeof(c)=='10'){// اذا كان تنوين مع الشدة
         results_2 += '0';
         result_A += String.fromCharCode(c);
         if(String.fromCharCode(d)=='ا' &&String.fromCharCode(shatr.codeUnitAt(i+5))==' '){// اذا كان الف بعد الشدّة i+3 و بعدها فراغ , نسيت ليه حطيت هالشرط بس كان لإصلاح مشكلة اكيد يبيلي ارجعله
           i++;
         }
         i++;
       }else if(methods.typeof(c)=='1'){// اذا كان بعد الشدّة حركة
         result_A += String.fromCharCode(c);
         i++;
       }else{
         result_A += 'َ';
       }
       i++;
     }else{// اذا كان مشكّل + تفادى كل الشروط السابقة ..
     results_2 += methods.typeof(b);
     result_A += String.fromCharCode(a)+String.fromCharCode(b);
     i++;

     }
           }



         }else{
           result_A += ' ';
         }



       }
       print("************************************\n ${results_2}\n***************************************");
       if(String.fromCharCode(results_2.codeUnitAt(results_2.length-1))=='1'){// اذا كان اخر حرف متحرك نضيف فقط 0 بالأخير عشان الوزن يستقيم

         results_2+='0';
       }
       print("this is result AAA \n $result_A");
       if(k_a == true){
         return result_A;
       }else {
         return results_2;
       }
     }









  }

// else if(methods._IsHarf(b)&&methods._IsItMad(b)==false){//اعتبار اي حرف أول الكلمة ساكن
// results_2 += '1';
// result_A += String.fromCharCode(a)+'َ';
// }



class methods
{

  static String replacea(String a)
  {
    List<String> aa = ["لَكِن", "هَذَا", "هَذِه", "هَذَان", "هَؤُلَاء", "هَذِي"];
    List<String> bb = ["لَاكِن", "هَاذَا", "هَاذِه", "هَاذَان", "هَاؤُلَاء", "هَاذِي"];
    for (int i = 0; i < aa.length; i++) {
      a = a.replaceAll(aa[i], bb[i]);
    }
    return a;
  }
  static bool _isAA(int a){
    if(String.fromCharCode(a)=='آ'){
      return true;
    }
    return false;
  }
  static bool _isConnectAA(int a,int b){
    if((String.fromCharCode(a)== 'ف'||String.fromCharCode(a)== 'و') && String.fromCharCode(b)== ' '){
      print("connnectttttttt");
      return true;
    }else if (String.fromCharCode(a)== ' '){
      return true;
    }else
    return false;
  }

  static bool _IsHarf(int a){
    switch (String.fromCharCode(a)) {
      case 'َ':
      case 'ِ':
      case 'ُ':
      case 'ً':
      case 'ٍ':
      case 'ٌ':
      case  'ْ':
      case 'ّ':
        return false;
    }
    return true;
  }
  static String typeof (int a){

    switch (String.fromCharCode(a)) {
      case 'َ':
      case 'ِ':
      case 'ُ':
      return "1";
      case 'ً':
      case 'ٍ':
      case 'ٌ':
    return "10";
      case  'ْ':
        return "0";
      case 'ّ':
        return "01";
      case 'أ':
      case 'ؤ':
      case 'ئ':
        return '1m';

    }
  return "-1";

  }
  static bool _IsItHarakah(int a)
  {
    switch (String.fromCharCode(a)) {
      case 'َ':
      case 'ِ':
      case 'ُ':
        return true;
    }
    return false;
  }

  static bool _IsItTanween(int a)
  {
    switch (String.fromCharCode(a)) {
      case 'ً':
      case 'ٍ':
      case 'ٌ':
        return true;
    }
    return false;
  }

  static bool _IsItMad(int a)
  {
    switch (String.fromCharCode(a)) {
      case 'ا':
      case 'و':
      case 'ي':
      case 'ى':
        return true;
    }
    return false;
  }

  static bool _IsItSokon(int a)
  {
    if (String.fromCharCode(a) == 'ْ') {
      return true;
    }
    return false;
  }

  static bool _IsItShadah(int a)
  {
    if (String.fromCharCode(a) == 'ّ') {
      return true;
    }
    return false;
  }

  static bool _IsItAL(int a, int after)
  {
    if ((String.fromCharCode(a) == 'ا') && (String.fromCharCode(after) == 'ل')) {
      return true;
    }
    return false;
  }

  static bool _IsItSunny(int a, int aftera, int aftera2)
  {
    if (_IsItAL(a, aftera) && _IsItShadah(aftera2)) {
      return true;
    }
    return false;
  }

  static bool _IsItMoony(int a, int aftera, int aftera2)
  {
    if ((_IsItAL(a, aftera) && (_IsItHarakah(aftera2) == false)) && (_IsItShadah(aftera2) == false)) {
      return true;
    }
    return false;
  }
}