import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:likelemba/style/color.dart';

class Annonce extends StatelessWidget {
  const Annonce({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: jaune, borderRadius: BorderRadius.all(Radius.circular(9))),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.bullhorn,
                  size: 14, color: vert)),
          const Text(
            'Enrollez plus de personne pour gagner plus',
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
