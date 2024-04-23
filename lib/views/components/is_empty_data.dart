import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
componente para los widget o listas vacias 
 */
class IsEmptyDataComponent extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Color? colorIcon;
  const IsEmptyDataComponent({
    super.key,
    required this.title,
    this.icon,
    this.colorIcon,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon ?? IconlyLight.folder,
            color: colorIcon ?? PaletteColorsTheme.blackColor, size: 70),
        SizedBox(height: size.height * .01),
        Text(title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w100)),
      ],
    );
  }
}

/*componenente para mosrar listas vacias, trae una imagen */
class IsEmptyWithImageComponents extends StatelessWidget {
  final String image;
  final String title;
  const IsEmptyWithImageComponents({
    super.key,
    required this.image,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: size.height * .3,
            child: Image.asset(image, fit: BoxFit.cover)),
        Text(title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w100, fontSize: 13))
      ],
    ).animate().fade().scale();
  }
}

/*
componente con imagen, texto y descripción
*/

class IsEmptyImageWithDescription extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const IsEmptyImageWithDescription({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: size.height * .3,
            child: Image.asset(image, fit: BoxFit.cover)),
        Text(title,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium),
        Text(description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.w100, fontSize: 13))
      ],
    ).animate().fade().scale();
  }
}
