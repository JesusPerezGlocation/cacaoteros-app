import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
icon button para guardar los datos en las cookies del dispositivo
*/
class SaveIconDraftComponents extends StatelessWidget {
  final Color color;
  const SaveIconDraftComponents({
    super.key,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          //Todo: debe mostrar un snackbar
          //Todo: debe guardar los datos en las cookies
          SnackBarGlobalWidget.showSnackBar(
              context,
              'En proceso de construcción',
              Icons.error_outlined,
              PaletteColorsTheme.yellowColor);
        },
        icon: Icon(
          Icons.save_as_outlined,
          size: 30,
          color: color,
        ));
  }
}
