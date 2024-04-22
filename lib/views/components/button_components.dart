import 'package:flutter/material.dart';
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
