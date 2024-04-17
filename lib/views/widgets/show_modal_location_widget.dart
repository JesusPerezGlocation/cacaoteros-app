import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
show modal para solicitar los permisos de ubicación
*/
class ShowModalLocation {
static showModalLocation(BuildContext context){
 return showModalBottomSheet(
    backgroundColor: PaletteColorsTheme.transparentColor,
    isScrollControlled: true,
    context: context, builder:(context) {
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
  height: size.height*.35,
  width: size.width,
  decoration:const BoxDecoration(
    color: PaletteColorsTheme.whiteColor,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
  ),

  child: ListView( 
    physics: const BouncingScrollPhysics(), 
    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, 
    padding: EdgeInsets.symmetric(horizontal: size.width * .03), 
    children: [ 
     const TitleAndCloseModal(title: 'Permisos denegados'),
         //SizedBox(  height: size.height * .25, child: Image.asset(UrlPathAssets.plant)), 
         SizedBox(height: size.height * .01), 
         Text('Acceder a la ubicación.', 
         style: Theme.of(context).textTheme.headlineMedium, 
         maxLines: 1, 
         overflow: TextOverflow.ellipsis, 
         textAlign: TextAlign.center),

         SizedBox(height: size.height * .01), 

         Text( 'Lo sentimos, no podemos usar tu ubicación en este momento. Asegurarse de habilitar los permisos de localización en la configuración de su dispositivo.', 
         style: Theme.of(context).textTheme.bodyMedium,
         maxLines: 4, 
         overflow: TextOverflow.ellipsis, 
         textAlign: TextAlign.center, ), 
         SizedBox(height: size.height * .04), 
         ButtonComponents(title: 'Abrir ajustes', onPressed: (){
           openAppSettings(); 
         })
         
           ]),
 );
 }
}