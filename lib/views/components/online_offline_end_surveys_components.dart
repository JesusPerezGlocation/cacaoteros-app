import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
componente para las pantallas finales en modo online
*/
class OnlineEndSurveysComponents extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final Function onSendData;
  final Function onDraft;
  const OnlineEndSurveysComponents({
    super.key,
    required this.title,
    required this.description,
    this.image,
    required this.onSendData,
    required this.onDraft,
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
        /*image*/
        SizedBox(
            height: size.height * .3,
            child: Image.asset(ImagesPaths.womanSend)),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: PaletteColorsTheme.secondaryColor),
        ),
        SizedBox(height: size.height * .005),
        Text(
          description,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        /*pregunta si tiene internet y muestra el boton si lo tiene */
        SizedBox(height: size.height * .06),
        /*enviar a la base */
        ButtonComponents(
          colorButton: PaletteColorsTheme.secondaryColor,
          title: 'Enviar encuesta',
          onPressed: () => onSendData(),
        ),
        SizedBox(height: size.height * .02),
        ButtonOutlineComponents(
          color: PaletteColorsTheme.secondaryColor,
          title: 'Guardar como borrador',
          onPressed: () => onDraft(),
        ),
        SizedBox(height: size.height * .06),
      ],
    ).animate().fade().scale();
  }
}

/*
componente para las pantallas finales en modo offline
*/
class OfflineEndSurveysComponents extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final Function onTap;
  const OfflineEndSurveysComponents({
    super.key,
    required this.title,
    this.image,
    required this.description,
    required this.onTap,
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
        /*image*/
        SizedBox(
            height: size.height * .3,
            child: Image.asset(image ?? ImagesPaths.noConecction)),
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: PaletteColorsTheme.secondaryColor),
        ),
        SizedBox(height: size.height * .005),
        Text(
          description,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: size.height * .02),
        ButtonOutlineComponents(
          color: PaletteColorsTheme.secondaryColor,
          title: 'Guardar como borrador',
          onPressed: () => onTap(),
        ),
        SizedBox(height: size.height * .06),
      ],
    ).animate().fade().scale();
  }
}
