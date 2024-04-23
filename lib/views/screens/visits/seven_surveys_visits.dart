// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

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
      appBar: AppBar(
        actions: visitsPrv.listImagesAdd.isNotEmpty
            ? [
                SaveIconDraftComponents(
                  icon: IconlyLight.delete,
                  color: PaletteColorsTheme.principalColor,
                  onTap: () =>
                      ShowModalPermissionGalleryWidget.showModalDeleteAllImage(
                          context),
                )
              ]
            : [],
      ),
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
          if (visitsPrv.listImagesAdd.isEmpty)
            const Center(
              child:
                  IsEmptyDataComponent(title: 'No hay imágenes para mostrar.'),
            )
          else
            SizedBox(
              height: size.height * .75,
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                itemCount: visitsPrv.listImagesAdd.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    /*muestra un boton al inicio de la lsita para añdir mas imagnees */
                    return ButtonAddImagenComponents(
                      onTap: () async {
                        await Permission.camera.request();
                        /*abre el modal para seleccionar foto o imagen */
                        ShowModalPermissionGalleryWidget.showModalSelectImage(
                            context);
                      },
                    );
                  } else {
                    /*lista de imagenes */
                    final base64Image = visitsPrv.listImagesAdd[index - 1];
                    final bytes = base64Decode(base64Image);
                    return FadeIn(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(15),
                        onTap: () {
                          if (bytes.isNotEmpty) {
                            /*navega a la pantalla de abrir la imagen */
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ViewImageVisitsScreen(
                                  image: bytes,
                                ),
                              ),
                            );
                          } else {
                            return SnackBarGlobalWidget.showSnackBar(
                              context,
                              'Lo sentimos, no pudimos abrir la imagen.',
                              Icons.error_outlined,
                              PaletteColorsTheme.redErrorColor,
                            );
                          }
                        },
                        child: Container(
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
                        ),
                      ),
                    );
                  }
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
            onPressed: () {
              //todo: debe llevar a la siguiente pantalla
            },
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
            /*abre el modal para seleccionar foto o imagen */
            ShowModalPermissionGalleryWidget.showModalSelectImage(context);
          },
        ),
      ],
    );
  }
}
