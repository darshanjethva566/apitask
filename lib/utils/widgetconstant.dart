import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wconstans{
  static Widget sizerwidth(var width,var height) => SizedBox(width: width,height: height,);
 static Widget textWithPro(var txt,double font,Color color, FontWeight fontWeight) => Text(txt,style: TextStyle(fontSize: font,color: color,fontWeight: fontWeight));

}