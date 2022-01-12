// ignore_for_file: must_be_immutable, unnecessary_brace_in_string_interps

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:likelemba/component/annonce.dart';
import 'package:likelemba/component/appbar.dart';
import 'package:likelemba/component/dashboard.dart';
import 'package:likelemba/component/infomembre.dart';
import 'package:likelemba/component/loadBase64.dart';
import 'package:likelemba/style/color.dart';
import 'package:likelemba/style/defaultavatar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Uint8List avatar = const Base64Decoder().convert(default_avatar);

  bool connection = false;

  @override
  void initState() {
    super.initState();
    isInternet();
  }

  void isInternet() async {
    try {
      final result = await InternetAddress.lookup('https://www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          connection = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        connection = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Likelemba',
      home: Scaffold(
        backgroundColor: blanc,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: <Widget>[
                appBar(
                  connection: connection,
                ),
                const Divider(),
                const Annonce(),
                infoMembre(
                  avatar: avatar,
                  connection: connection,
                  press: () {
                    // ignore: avoid_print
                    print('message');
                  },
                ),
                dashboard(
                  image1: const FaIcon(
                    FontAwesomeIcons.addressCard,
                    size: 19,
                    color: jaune,
                  ),
                  label1: 'Enrolez !',
                  press1: () {},
                  pack1: '',
                  image2: const FaIcon(
                    FontAwesomeIcons.chartArea,
                    size: 20,
                    color: jaune,
                  ),
                  label2: 'Stats',
                  pack2: '',
                  press2: () {},
                  image3: const FaIcon(
                    FontAwesomeIcons.moneyBillWaveAlt,
                    size: 19,
                    color: jaune,
                  ),
                  label3: 'Retirer',
                  pack3: '',
                  press3: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const soldeCompte(),
                const ListTile(
                  leading: Text(
                    'RECENTE TRANSACTIONS',
                    style: TextStyle(color: blanc),
                  ),
                ),
                transaction(
                  avatar: avatar,
                  details: 'Nouvel enroulement',
                  code: '123456938',
                  solde: '3500',
                  nom: 'Ngoyi',
                  prenom: 'Mavy',
                ),
                const SizedBox(
                  height: 2,
                ),
                transaction(
                  avatar: avatar,
                  details: 'Nouvel enroulement',
                  code: '123456938',
                  solde: '3500',
                  nom: 'Ngoyi',
                  prenom: 'Mavy',
                ),
                const SizedBox(
                  height: 2,
                ),
                transaction(
                  avatar: avatar,
                  details: 'Nouvel enroulement',
                  code: '123456938',
                  solde: '3500',
                  nom: 'Ngoyi',
                  prenom: 'Mavy',
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class transaction extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var code;
  // ignore: prefer_typing_uninitialized_variables
  var details;
  // ignore: prefer_typing_uninitialized_variables
  var solde;
  // ignore: prefer_typing_uninitialized_variables
  var nom;
  // ignore: prefer_typing_uninitialized_variables
  var prenom;

  transaction(
      {Key? key,
      required this.avatar,
      this.nom,
      this.prenom,
      this.code,
      this.details,
      this.solde})
      : super(key: key);

  final Uint8List avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 6),
      decoration: const BoxDecoration(
          color: jaune, borderRadius: BorderRadius.all(Radius.circular(4))),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(),
                child: CircleAvatar(
                  backgroundColor: dark,
                  child: loadBase64(avatar: avatar),
                ),
              ),
            ),
            title: Text(
              nom + ' ' + prenom,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: Text(
              '${code} : ${details}',
              style: const TextStyle(color: Colors.black, fontSize: 15),
            ),
            trailing: OutlinedButton(
              onPressed: null,
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0))),
              ),
              child: Text(
                "${solde}F",
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class soldeCompte extends StatelessWidget {
  const soldeCompte({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(9))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ListTile(
              leading: Text(
                'INFORMATIONS DE COMPTE',
                style: TextStyle(color: blanc),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              child: dashboard(
                press1: () {},
                pack1: 'PACK STANDARDS',
                image1: const FaIcon(
                  FontAwesomeIcons.moneyBill,
                  size: 19,
                  color: jaune,
                ),
                press2: () {},
                label1: '120.000.345F',
                pack2: 'PACK INTERMEDIARE',
                image2: const FaIcon(
                  FontAwesomeIcons.moneyCheckAlt,
                  size: 20,
                  color: jaune,
                ),
                label2: '120.345F',
                pack3: 'PACK GOLD',
                image3: const FaIcon(
                  FontAwesomeIcons.bitcoin,
                  size: 19,
                  color: jaune,
                ),
                label3: '160.345F',
                press3: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
