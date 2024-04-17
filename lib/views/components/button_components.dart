import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

class ButtonComponents extends StatelessWidget {
  final String title;
  final Function onPressed;
  const ButtonComponents({
    super.key,
    required this.title,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * .07,
      child: ElevatedButton(
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
  final Function onPressed;
const ButtonOutlineComponents({
  super.key, 
  required this.title, 
  required this.onPressed});
 @override
 Widget build(BuildContext context) {
final size = MediaQuery.of(context).size;
 return SizedBox(
      width: size.width,
      height: size.height * .07,
      child: OutlinedButton(
        
        style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteColorsTheme.principalColor)),
          side:const MaterialStatePropertyAll(BorderSide(
            color: PaletteColorsTheme.principalColor,
            width: 1
          ))
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
check button para aceptar terminos, o respuestas
*/
class CheckbuttonComponent extends StatelessWidget {
  final String title;
  final bool check;
  final Function onPressed;
const CheckbuttonComponent({
  super.key, 
  required this.title, 
  required this.check,
  required this.onPressed
  });
 @override
 Widget build(BuildContext context) {
 return ListTile(
  onTap: () => onPressed(),
  contentPadding: EdgeInsets.zero,
  leading: Icon(check?Icons.check_circle:Icons.circle_outlined,color: PaletteColorsTheme.principalColor, shadows: [BoxShadow(color:PaletteColorsTheme.principalColor.withOpacity(0.5), blurRadius: 14 )]),
  title: Text(
    title,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: PaletteColorsTheme.principalColor, decoration: TextDecoration.underline)
    ,),
 );
 }
}