import 'package:ffi/ffi.dart';
import 'package:arowdi_app/back_end/taffeelat/Taffelat_search.dart';
class search{
   String converter_method(String shatr,bool return_arowid_draw){

       shatr = methods.replacea(shatr);
       shatr = shatr.replaceAll('َّ', 'َّ');
       shatr = shatr.replaceAll('ُّ','ُّ');
       shatr = shatr.replaceAll('ِّ','ِّ');
       //shatr = shatr.replaceAll(' ', '');
        print(shatr);
       
       String binary_ketaba = "" ;
       String arowdi_ketaba = "";
        shatr = "   " +shatr+"     ";// أضفنا بعض المسافات قبل وبعد النص لتفادي مشكلة أخذ أحرف بعدية للكلمة
        print(shatr);
       for (int i = 3; i < shatr.length; i++) {// loop start after space

         if(String.fromCharCode(shatr.codeUnitAt(i))!=' '){//isn't space?
         /*
         *  لتفادي العديد من المشاكل الحاصلة أثناء نقل الأحرف بين الكود قمت بتحول الحرف المأخوذ بداية من شكله العادي الى صيغة أرقام
         * */
           int a = shatr.codeUnitAt(i);//first letter
           int b = shatr.codeUnitAt(i+1);//second letter
           int c = shatr.codeUnitAt(i+2);//third letter
           int d = shatr.codeUnitAt(i+3);//fourth letter
           int e = shatr.codeUnitAt(i+4);//fifth letter

           if(methods._IsHarf(b)==true&&methods._IsHarf(a)){// اذا لم يكن الحرف مشكّلاً

             if(methods._isAA(a)){// اذا كان الف ممدودة
               binary_ketaba += '10';
               arowdi_ketaba += String.fromCharCode(a);
             }else if (String.fromCharCode(a)=='ا'){ // اذا كان الف
               if(methods._IsItAL(a, b)){// اذا كان ال
                 print('al');
                if(methods.type_of_harakah(c)=='1'){// اذا كانت اللام مشكلة , يعني أنها ليست ال تعريف
                  binary_ketaba += '0';
                  arowdi_ketaba += String.fromCharCode(a) + 'ْ';
                }else if(methods.type_of_harakah(d)=='01'){// اذا كان ال شمسية
                  if(i == 3){// اذا كانت ال أول كلمة في الشطر
                    arowdi_ketaba += 'أ';
                    binary_ketaba += '1';
                  }
                  arowdi_ketaba += String.fromCharCode(c)+'ْ'+String.fromCharCode(c);
                  binary_ketaba += '01';
                  if(methods.type_of_harakah(e)=='1'){// اذا رافق الشدّة حركة
                    arowdi_ketaba += String.fromCharCode(e);
                    i+=1;
                  }else{// اذا لم يرافق الشدّة حركة
                    arowdi_ketaba += 'َ';
                  }
                  i+=3;
                }else if(methods.type_of_harakah(d)=='1'){// اذا كان ال قمرية
                  if(i == 3){// اذا كانت ال أول كلمة في الشطر
                    arowdi_ketaba += 'أ';
                    binary_ketaba += '1';
                  }
                  arowdi_ketaba += String.fromCharCode(b)+'ْ'+String.fromCharCode(c)+String.fromCharCode(d);
                  binary_ketaba += '01';
                  i+=3;
                }else{
                  arowdi_ketaba += String.fromCharCode(a)+'ْ';
                  binary_ketaba += '0';
                }
               }else if(String.fromCharCode(shatr.codeUnitAt(i-1))=='و'&& String.fromCharCode(b)==' ') {//اذا كانت الف واو الجماعة
                 i++;
               }else if(methods._IsItAL(c, d)){// اذا كانت ال بعد المد

               }else if(methods._isConnectAA(shatr.codeUnitAt(i-1), shatr.codeUnitAt(i-2))){// اذا كانت الف موصولة
                if((String.fromCharCode(shatr.codeUnitAt(i-1))== 'ف'||String.fromCharCode(shatr.codeUnitAt(i-1))== 'و') ){// اذا كان قبلها ف او و للألف الموصولة يتجاوز الألف

                }else{// يتجاوز الألف والحرف الذي يليها ويجعله ساكناً
                  arowdi_ketaba += String.fromCharCode(b)+'ْ';
                 i++;
                }
               }else{// اذا كانت الألف مداً
                 arowdi_ketaba += String.fromCharCode(a)+'ْ';
                 binary_ketaba += '0';
               }
             }else if(methods._IsItMad(a)&&String.fromCharCode(a)!='ا'){//اذا كان مد غير الألف

               if(methods._IsItAL(c, d)&&String.fromCharCode(b)==' '){// اذا كانت ال بعد المد

               }else if(methods._IsItMad(b)){// اذا كان حرفي مد متتالين
                 arowdi_ketaba += String.fromCharCode(a)+'َ';
                 binary_ketaba += '1';
               }else if(methods._IsHarf(a)&&String.fromCharCode(shatr.codeUnitAt(i-1))==' '){//اعتبار اي حرف أول الكلمة ساكن
                 binary_ketaba += '1';
                 arowdi_ketaba += String.fromCharCode(a)+'َ';
               }else if(methods._IsHarf(b)){// اذا كان حرف المد بدون حرف مد متتالي
                 arowdi_ketaba += String.fromCharCode(a)+'ْ';
                 binary_ketaba += '0';
               }
             }else if(String.fromCharCode(b)=='ا'&&methods.type_of_harakah(c)=='10'){// اذا كان التنوين على الحرف وبعده ألف التنوين
              binary_ketaba += '10';
              arowdi_ketaba += String.fromCharCode(a) + 'ن';
              i+=2;
             }else if(methods._IsItMad(b)&&methods.type_of_harakah(c)!='1'){// اعتبار اي حرف لا حركة عليه وبعده مد متحرك
              binary_ketaba += '1';
              arowdi_ketaba += String.fromCharCode(a)+ 'َ';
             }else if(methods._IsHarf(a)&&String.fromCharCode(shatr.codeUnitAt(i-1))==' '){//اعتبار اي حرف أول الكلمة ساكن
               binary_ketaba += '1';
               arowdi_ketaba += String.fromCharCode(a)+'َ';
             }else{// اعتبار اي حرف ساكن مالم يكن من الحالات المذكورة اعلاه

               binary_ketaba += '0';
               arowdi_ketaba += String.fromCharCode(a) +'ْ';
             }


           }else{// اذا كان الحرف مشكل***********************************************************
     if(methods.type_of_harakah(shatr.codeUnitAt(i-1))=='1'&&String.fromCharCode(a)=='ه'&&methods.type_of_harakah(b)=='1'&& String.fromCharCode(c)==' '){//اذا كانت الهاء التي بعدها حركة وقبلها حركة
       i++;
       binary_ketaba += '10';
      arowdi_ketaba += String.fromCharCode(a)+String.fromCharCode(b)+'ي';
     }else if(methods.type_of_harakah(b)=='10'){// اذا كان تنوين
       binary_ketaba += methods.type_of_harakah(b);
       arowdi_ketaba += String.fromCharCode(a)+'ن';
       if(String.fromCharCode(b)=='ا' &&String.fromCharCode(c)==' '){// اذا كان بعد التنوين الف التنوين
         i++;
       }
       i+=2;
     }else if(methods.type_of_harakah(b)=='01'){// اذا كانت شدّة
       binary_ketaba += methods.type_of_harakah(b);
       arowdi_ketaba += String.fromCharCode(a)+'ْ'+String.fromCharCode(a);
       if(methods.type_of_harakah(c)=='10'){// اذا كان تنوين مع الشدة
         binary_ketaba += '0';
         arowdi_ketaba += String.fromCharCode(c);
         if(String.fromCharCode(d)=='ا' &&String.fromCharCode(shatr.codeUnitAt(i+5))==' '){// اذا كان الف بعد الشدّة i+3 و بعدها فراغ , نسيت ليه حطيت هالشرط بس كان لإصلاح مشكلة اكيد يبيلي ارجعله
           i++;
         }
         i++;
       }else if(methods.type_of_harakah(c)=='1'){// اذا كان بعد الشدّة حركة
         arowdi_ketaba += String.fromCharCode(c);
         i++;
       }else{
         arowdi_ketaba += 'َ';
       }
       i++;
     }else{// اذا كان مشكّل + تفادى كل الشروط السابقة ..
     binary_ketaba += methods.type_of_harakah(b);
     arowdi_ketaba += String.fromCharCode(a)+String.fromCharCode(b);
     i++;

     }
           }



         }else{
           arowdi_ketaba += ' ';
         }



       }
       print("************************************\n ${binary_ketaba}\n***************************************");
       if(String.fromCharCode(binary_ketaba.codeUnitAt(binary_ketaba.length-1))=='1'){// اذا كان اخر حرف متحرك نضيف فقط 0 بالأخير حتّى يستقيم الوزن

         binary_ketaba+='0';
       }
       print("this is result AAA \n $arowdi_ketaba");
       if(return_arowid_draw == true){// التأكد من الصيغة المراد ارجاعها
         return arowdi_ketaba;
       }else {
         return binary_ketaba;
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
  static String type_of_harakah (int a){

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

}