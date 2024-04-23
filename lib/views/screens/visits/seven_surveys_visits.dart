// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
pantalla siete #7 para los registros de visita
*/
class SevenSurveysVisitsScreen extends StatelessWidget {
  const SevenSurveysVisitsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    final cemeraPermissionPrv = Provider.of<CameraPermissionProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: FadeIn(
          child: visitsPrv.listImagesAdd.isEmpty
              ? _EmptyScreenImageComponents(
                  visitsPrv: visitsPrv,
                  cemeraPermissionPrv: cemeraPermissionPrv,
                )
              : _ListImageSelectComponents(
                  visitsPrv: visitsPrv,
                  cemeraPermissionPrv: cemeraPermissionPrv,
                )),
    );
  }
}

/*
lista de imagenes seleccionadas
*/
class _ListImageSelectComponents extends StatelessWidget {
  final VisitsSurveysProvider visitsPrv;
  final CameraPermissionProvider cemeraPermissionPrv;
  const _ListImageSelectComponents({
    required this.visitsPrv,
    required this.cemeraPermissionPrv,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * .03),
      child: Column(
        children: [
          SizedBox(
            height: size.height * .75,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: visitsPrv.listImagesAdd.length,
              itemBuilder: (context, index) {
                final base64Image = visitsPrv.listImagesAdd[index];
                final bytes = base64Decode(base64Image);

                return Container(
                  decoration: BoxDecoration(
                      color: PaletteColorsTheme.greyColor,
                      borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.memory(bytes,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(ImagesPaths.errorImage)),
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: size.height * .02,
                crossAxisSpacing: size.width * .02,
                mainAxisExtent: size.height * .15,
              ),
            ),
          ),
          ButtonComponents(
            title: 'Continuar',
            colorButton: PaletteColorsTheme.principalColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

/*buton y imagen vacio */
class _EmptyScreenImageComponents extends StatelessWidget {
  final VisitsSurveysProvider visitsPrv;
  final CameraPermissionProvider cemeraPermissionPrv;
  const _EmptyScreenImageComponents({
    required this.visitsPrv,
    required this.cemeraPermissionPrv,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .03, vertical: size.height * .03),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        // Image.asset(ImagesPaths.selectImage)
        IsEmptyImageWithDescription(
          title: 'Selección de imágenes para registro.',
          description:
              'Por favor, sube una o más imágenes que documenten tu visita. Estas imágenes servirán como registro de tu experiencia con nosotros. ',
          image: ImagesPaths.selectImage,
        ),
        SizedBox(height: size.height * .06),
        ButtonComponents(
          title: 'Seleccionar o tomar imagen',
          colorButton: PaletteColorsTheme.principalColor,
          onPressed: () async {
            await Permission.camera.request();
            // await visitsPrv.dataPickerImage();
            ShowModalPermissionGalleryWidget.showModalSelectImage(context);
          },
        ),
      ],
    );
  }
}
