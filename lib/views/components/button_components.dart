import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

class ButtonComponents extends StatelessWidget {
  final String title;
  final Function onPressed;
  final Color colorButton;
  const ButtonComponents({
    super.key,
    required this.title,
    required this.colorButton,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * .07,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(colorButton),
          shadowColor: MaterialStatePropertyAll(colorButton.withOpacity(0.5)),
        ),
        onPressed: () => onPressed(),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

/*
estilo de boton secundario
*/
class ButtonOutlineComponents extends StatelessWidget {
  final String title;
  final Color? color;
  final Function onPressed;
  const ButtonOutlineComponents({
    super.key,
    required this.title,
    this.color,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * .07,
      child: OutlinedButton(
        style: ButtonStyle(
            textStyle: MaterialStatePropertyAll(Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: color ?? PaletteColorsTheme.principalColor)),
            side: MaterialStatePropertyAll(BorderSide(
                color: color ?? PaletteColorsTheme.principalColor, width: 1))),
        onPressed: () => onPressed(),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: color ?? PaletteColorsTheme.principalColor),
        ),
      ),
    );
  }
}

/*
check button para aceptar terminos, o respuestas
*/
class CheckbuttonComponent extends StatelessWidget {
  final String title;
  final bool check;
  final Color colorButton;
  final Function onPressed;
  const CheckbuttonComponent({
    super.key,
    required this.title,
    required this.check,
    required this.colorButton,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onPressed(),
      contentPadding: EdgeInsets.zero,
      leading: Icon(check ? Icons.check_circle : Icons.circle_outlined,
          color: colorButton,
          shadows: [
            BoxShadow(
                color: PaletteColorsTheme.principalColor.withOpacity(0.5),
                blurRadius: 14)
          ]),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: colorButton, decoration: TextDecoration.underline),
      ),
    );
  }
}

/*
boton para añadir imagen 
*/
class ButtonAddImagenComponents extends StatelessWidget {
  final Function onTap;
  const ButtonAddImagenComponents({
    super.key,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            color: PaletteColorsTheme.principalColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: PaletteColorsTheme.principalColor.withOpacity(0.5),
                  blurRadius: 14)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              IconlyLight.camera,
              color: PaletteColorsTheme.whiteColor,
              size: 35,
            ),
            SizedBox(height: size.height * .002),
            Text(
              'Añadir',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: PaletteColorsTheme.whiteColor),
            )
          ],
        ),
      ),
    );
  }
}

/*componente para el boton del slider */
class ButtonSliderComponents extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final Function onTap;
  const ButtonSliderComponents({
    super.key,
    required this.color,
    required this.iconData,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      splashColor: color.withOpacity(0.5),
      borderRadius: BorderRadius.circular(15),
      onTap: () => onTap(),
      child: Container(
        height: size.height * .1,
        width: size.width * .25,
        margin: EdgeInsets.symmetric(vertical: size.height * .001),
        decoration: BoxDecoration(
            color: color.withOpacity(0.7),
            borderRadius: BorderRadius.circular(15)),
        child: Icon(
          iconData,
          color: PaletteColorsTheme.whiteColor,
          size: 35,
        ),
      ),
    );
  }
}
