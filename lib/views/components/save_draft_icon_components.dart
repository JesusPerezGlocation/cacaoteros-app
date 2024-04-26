import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
icon button para guardar los datos en las cookies del dispositivo
*/
class SaveIconDraftComponents extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final Function onTap;
  const SaveIconDraftComponents({
    super.key,
    required this.color,
    required this.onTap,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onTap(),
        icon: Icon(
          icon ?? IconlyLight.bookmark,
          size: 30,
          color: color,
        )).animate().fade().scale();
  }
}

/*circular avatar para guardar en borrador*/

class CircleAvatarSaveIconDraftComponent extends StatelessWidget {
  final Color color;
  final Color? colorCircle;
  final IconData? icon;
  final Function onTap;
  const CircleAvatarSaveIconDraftComponent({
    super.key,
    required this.color,
    this.icon,
    required this.onTap,
    this.colorCircle,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: EdgeInsets.only(right: size.width * .03),
        child: CircleAvatar(
          backgroundColor: colorCircle ?? PaletteColorsTheme.whiteColor,
          child: Center(
            child: Icon(
              icon ?? IconlyLight.bookmark,
              size: 30,
              color: color,
            ),
          ),
        ),
      ),
    ).animate().fade().scale();
  }
}

/*
boton para mostrarle al usuario que puede subir los archivos locales a firabase
*/
class UpLoadDataSurveysComponent extends StatelessWidget {
  final Color color;
  final IconData? icon;
  final Function onTap;
  const UpLoadDataSurveysComponent({
    super.key,
    required this.color,
    this.icon,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => onTap(),
        icon: Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(
              icon ?? Icons.cloud_upload_outlined,
              size: 30,
              color: color,
            ),
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                  boxShadow: [
                    BoxShadow(
                        color: color.withOpacity(0.9),
                        blurRadius: 3,
                        offset: const Offset(0, 2))
                  ]),
            )
          ],
        )).animate().fade().scale();
  }
}
