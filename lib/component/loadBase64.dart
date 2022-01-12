// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'dart:typed_data';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class loadBase64 extends StatelessWidget {
  const loadBase64({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  final Uint8List avatar;

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      avatar,
      width: 60,
    );
  }
}
