import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
clase para los modals de carga
*/
class ShowModalLoadingWidget {
  static showLoadingView(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return showDialog(
        barrierDismissible: false,
        barrierColor: PaletteColorsTheme.blackColor.withOpacity(0.3),
        context: context,
        builder: (context) => AlertDialog.adaptive(
            elevation: 10,
            contentPadding: EdgeInsets.zero,
            content: Container(
              height: size.height * .23,
              width: size.width,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: const Center(child: LoadingAppComponent()),
            )));
  }
}
