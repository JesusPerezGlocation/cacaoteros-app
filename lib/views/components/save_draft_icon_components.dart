import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

/*
icon button para guardar los datos en las cookies del dispositivo
*/
class SaveIconDraftComponents extends StatelessWidget {
  final Color color;
  final Function onTap;
  const SaveIconDraftComponents({
    super.key,
    required this.color,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onTap(),
        icon: Icon(
          IconlyLight.bookmark,
          size: 30,
          color: color,
        ));
  }
}
