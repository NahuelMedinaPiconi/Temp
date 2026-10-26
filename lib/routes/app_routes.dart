import 'package:catinteractiu/screens/alert_screen.dart';
import 'package:catinteractiu/screens/animated_container_screen.dart';
import 'package:catinteractiu/screens/avatar_screen.dart';
import 'package:catinteractiu/screens/card_secreen.dart';
import 'package:catinteractiu/screens/home_screen.dart';
import 'package:catinteractiu/screens/inputs_screen.dart';
import 'package:catinteractiu/screens/listview_screen.dart';
import 'package:catinteractiu/screens/slider_screen.dart';

import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes(){
 return <String, WidgetBuilder>{
       '/'         : (BuildContext context) => HomePage(),
       'alert'     : (BuildContext context) => AlertScreen(),
       'avatar'    : (BuildContext context) => AvatarScreen(),
       "card"     : (BuildContext context) => CardScreen(),
       "animatedContainer"  : (BuildContext context) => AnimatedContainerScreen(),
       "inputs"   : (BuildContext context) => InputScreen(),
       "slider"    : (BuildContext context) => SliderScreen(),
       "list"     : (BuildContext context) => LlistaScreen()
     };
}
