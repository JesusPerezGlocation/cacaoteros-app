
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
pantalla para mostrarle al usuario que termino la en cuenta, si la quiere guardar como borrador o enviar 
*/
class EndSurveysScreen extends StatelessWidget {

const EndSurveysScreen({super.key});
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return Scaffold(
  appBar: AppBar(),
  body: ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: size.width*.03, vertical: size.height*.03),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    children: [
      /*image*/
      SizedBox(height: size.height*.3,child: Image.asset(ImagesPaths.womanSend)),
      Text('Title Surveys Data',maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleLarge,),
      SizedBox(height: size.height*.005),
      Text("No podrá realizar ediciones una vez que envíe. Si necesita hacer cambios, presione en 'Guardar como borrador' hasta que esté listo para enviar.",maxLines: 5,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium,),
      SizedBox(height: size.height*.06),
      /*enviar a la base */
      ButtonComponents(
        title: 'Enviar encuesta', 
        onPressed: (){
        //Todo: debe enviar a la base
      }),
      SizedBox(height: size.height*.02),

      ButtonOutlineComponents(
        title: 'Guardar como borrador', 
        onPressed: (){
          //Todo: debe guardar el borrador en la base sql
        }
        ),

      SizedBox(height: size.height*.06),
    ],
  ).animate().fade().scale(),
 );
 
 }
}