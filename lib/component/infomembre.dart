import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:likelemba/component/loadBase64.dart';
import 'package:likelemba/style/color.dart';

// ignore: camel_case_types, must_be_immutable
class infoMembre extends StatelessWidget {
  bool connection;
  Function() press;
  infoMembre(
      {Key? key,
      required this.connection,
      required this.avatar,
      required this.press})
      : super(key: key);

  final Uint8List avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      decoration: const BoxDecoration(color: blanc),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: const BoxDecoration(),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: loadBase64(avatar: avatar),
            ),
          ),
        ),
        title: const Text(
          'Ngoyi Mavy',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: const Text(
          'Matricule : WETYCDDJUI0',
          style: TextStyle(color: blanc),
        ),
        trailing: OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
          ),
          child: const Text(
            "EDITER",
            style: TextStyle(color: jaune, fontSize: 13),
          ),
        ),
      ),
    );
  }
}
