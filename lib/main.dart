import 'package:flutter/material.dart';
import 'package:unit_convertor/desktop.dart';
import 'mobile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      if(constraints.maxWidth < 418){
        return MobileScreen();
      }
      else{
        return DesktopScreen();
      }
    });
  }
}
