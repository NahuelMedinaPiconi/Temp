import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'add_alert': Icons.add_alert_rounded,
  'account_circle': Icons.account_circle_outlined,
  'folder_open': Icons.folder_open_rounded,
};

Icon getIcon(String nomIcona) {
  return Icon(_icons[nomIcona], color: Colors.blue);
}