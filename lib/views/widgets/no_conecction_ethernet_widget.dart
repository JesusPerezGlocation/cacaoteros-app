import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
/*
show modal para mostrar cuando no tiene internet
*/

class ConecctionModalEthernetWidget {
  static showConecctionModal(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: PaletteColorsTheme.transparentColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const _ContainerShowModal();
        });
  }
}

class _ContainerShowModal extends StatelessWidget {
  const _ContainerShowModal();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .52,
      width: size.width,
      decoration: const BoxDecoration(
          color: PaletteColorsTheme.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          SizedBox(
              height: size.height * .25,
              child: Image.asset(ImagesPaths.noConecction)),
          Text(
            'Sin conexión a internet',
            style: Theme.of(context).textTheme.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            'En este momento no dispone de conexión, puede almacenar las encuestas en borradores y posteriormente enviarlas.',
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * .05),
          ButtonComponents(
            colorButton: PaletteColorsTheme.principalColor,
            title: 'Volver a intentar',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ).animate().fade().scale(),
    );
  }
}
