import 'package:flutter/material.dart';

final _icons = {
  'add_alert': Icons.add_alert,
  'account_circle': Icons.account_circle,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list,
};

Icon getIcon(String nomIcona) {
  return Icon(_icons[nomIcona], color: Colors.blue);
}