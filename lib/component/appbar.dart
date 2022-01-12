import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:likelemba/style/color.dart';

// ignore: camel_case_types, must_be_immutable
class appBar extends StatefulWidget {
  bool connection;

  appBar({Key? key, required this.connection}) : super(key: key);

  @override
  State<appBar> createState() => _appBarState();
}

// ignore: camel_case_types
class _appBarState extends State<appBar> {
  @override
  Widget build(BuildContext context) {
    //String tdata = DateFormat("HH:mm:ss").format(DateTime.now());
    late bool connection = widget.connection;
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (connection == true)
              ? IconButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      elevation: 1,
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.black,
                      content: const Text(
                        '\t Yay ! \t \t Vous etes online!',
                        style: TextStyle(color: jaune, fontSize: 19),
                      ),
                      action: SnackBarAction(
                        textColor: Colors.amber,
                        label: 'ok!',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.wifi,
                    size: 15,
                    color: jaune,
                  ))
              : IconButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      elevation: 1,
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      behavior: SnackBarBehavior.fixed,
                      backgroundColor: Colors.black,
                      content: const Text(
                        '\t Oups ! \t \t Vous etes hors ligne!',
                        style: TextStyle(color: Colors.redAccent, fontSize: 19),
                      ),
                      action: SnackBarAction(
                        textColor: Colors.redAccent,
                        label: 'ok!',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.wifi,
                    size: 15,
                    color: Colors.redAccent,
                  )),
          // ignore: prefer_const_constructors
          Center(
            child: const Text.rich(TextSpan(
                text: 'Tableau de Bord \n',
                style: TextStyle(fontSize: 20, color: Colors.white),
                children: <InlineSpan>[
                  TextSpan(
                      text: 'o',
                      style: TextStyle(fontSize: 14, color: Colors.green)),
                  TextSpan(
                    text: '  vous etes en ligne',
                    style: TextStyle(fontSize: 14, color: blanc),
                  )
                ])),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('12:04', style: TextStyle(fontSize: 14, color: blanc)),
          )
        ],
      ),
    );
  }
}
