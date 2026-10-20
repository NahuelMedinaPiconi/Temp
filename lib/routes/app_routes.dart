import 'package:catinteractiu/screens/alert_screen.dart';
import 'package:catinteractiu/screens/avatar_screen.dart';
import 'package:catinteractiu/screens/card_secreen.dart';
import 'package:catinteractiu/screens/home_screen.dart';

import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes(){
 return <String, WidgetBuilder>{
       '/'         : (BuildContext context) => HomePage(),
       'alert'     : (BuildContext context) => AlertScreen(),
       'avatar'    : (BuildContext context) => AvatarScreen(),
       "cards"     : (BuildContext context) => CardScreen()
     };
}
