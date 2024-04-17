

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';
import 'package:surveys_app/controllers/theme/palette_colors_theme.dart';
/*
boton para la pantalla #11 para añadir miembro
*/
class IconButtonAddMemberComponents extends StatelessWidget {

const IconButtonAddMemberComponents({super.key});
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return IconButton(
    onPressed: (){
   //Todo: debe abrir la lista de familiares, si la lista esta vacia debe abrir la pantalla de input para add y si no debe mostrar la lista de miembros añadidos a la encuenta
   //Todo: si la lista tiene datos debe navegar a MainRoutes.listMembersRoute si no a elevenSurveysRoute
   //Todo: al estar en la pantalla de añadir un nuevo miembro, al crearlos debe mostrar un snabbar y hacer navegto.pop,
   //Todo: la lista debe ser retornada por gestor de estado, para que se actualice
   Navigator.pushNamed(context, MainRoutes.listMembersRoute);
  }, 
  icon: Ink(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
             boxShadow: [
          BoxShadow(
            color: PaletteColorsTheme.blackColor.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 20,
          )
        ],
        
    ),
    child: CircleAvatar(
      backgroundColor: PaletteColorsTheme.whiteColor,
      radius: size.height*.035, 
    child:const Icon(Icons.person_add_alt_outlined, size: 30, color: PaletteColorsTheme.principalColor,)),
  )).animate().fade().scale();
 }
}

