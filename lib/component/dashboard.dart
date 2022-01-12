import 'package:flutter/material.dart';
import 'package:likelemba/style/color.dart';

// ignore: must_be_immutable, camel_case_types
class dashboard extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var image1;
  // ignore: prefer_typing_uninitialized_variables
  var image2;
  // ignore: prefer_typing_uninitialized_variables
  var image3;
  // ignore: prefer_typing_uninitialized_variables
  var label1;
  // ignore: prefer_typing_uninitialized_variables
  var label2;
  // ignore: prefer_typing_uninitialized_variables
  var label3;
  // ignore: prefer_typing_uninitialized_variables
  var pack1;
  // ignore: prefer_typing_uninitialized_variables
  var pack2;
  // ignore: prefer_typing_uninitialized_variables
  var pack3;

  Function() press1;
  Function() press2;
  Function() press3;

  dashboard({
    Key? key,
    this.image1,
    this.image2,
    this.image3,
    this.label1,
    this.label2,
    this.label3,
    this.pack1,
    this.pack2,
    this.pack3,
    required this.press1,
    required this.press2,
    required this.press3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
      decoration: const BoxDecoration(
          color: blanc, borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: press1,
            child: Column(
              children: [
                Text(
                  pack1,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
                IconButton(onPressed: null, icon: image1),
                Text(
                  label1,
                  style: const TextStyle(color: jaune),
                )
              ],
            ),
          ),
          InkWell(
            onTap: press2,
            child: Column(
              children: [
                Text(
                  pack2,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
                IconButton(onPressed: null, icon: image2),
                Text(
                  label2,
                  style: const TextStyle(color: jaune),
                )
              ],
            ),
          ),
          InkWell(
            onTap: press3,
            child: Column(
              children: [
                Text(
                  pack3,
                  style: const TextStyle(color: Colors.white, fontSize: 10),
                ),
                IconButton(onPressed: null, icon: image3),
                Text(
                  label3,
                  style: const TextStyle(color: jaune),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
