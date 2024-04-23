import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
ver imagen en grande desde la lista añadida
*/
class ViewImageVisitsScreen extends StatelessWidget {
  final Uint8List image;
  const ViewImageVisitsScreen({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          SaveIconDraftComponents(
            icon: IconlyLight.delete,
            color: PaletteColorsTheme.whiteColor,
            onTap: () async {
              /*elimina la foto */
              visitsPrv.deleteOneImage(image);
              /*navega a la pantalla anterior*/
              Navigator.pop(context);

              SnackBarGlobalWidget.showSnackBar(
                  context,
                  'Imagen elimina con éxito!',
                  Icons.check_circle_rounded,
                  PaletteColorsTheme.principalColor);
            },
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: InteractiveViewer(
              child: Image.memory(image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(ImagesPaths.errorImage))),
        ),
      ),
    );
  }
}
