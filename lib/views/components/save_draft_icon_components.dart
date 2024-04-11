import 'package:flutter/material.dart';
/*
icon button para guardar los datos en las cookies del dispositivo
*/
class SaveIconDraftComponents extends StatelessWidget {

const SaveIconDraftComponents({super.key});
 @override
 Widget build(BuildContext context) {
 return  IconButton(onPressed: (){
  //Todo: debe mostrar un snackbar 
  //Todo: debe guardar los datos en las cookies
 }, 
 icon:const Icon(Icons.save_as_outlined, size: 30,)
 );
 }
}