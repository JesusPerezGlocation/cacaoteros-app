import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
pantalla para mostrar la lista de miembros añadidos en la pantalla #11
*/
class ListMembersScreen extends StatelessWidget {

const ListMembersScreen({super.key});
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return Scaffold(
  floatingActionButton:const IconButtonAddMemberComponents(),
  appBar: AppBar(),
  body: Padding(
    padding: EdgeInsets.symmetric(horizontal: size.width*.03, vertical: size.height*.03),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleSurveysComponents(title:'LISTA DE MIEMBROS' ), 
         SizedBox(height: size.height*.03),
       Expanded(
        child:FadeIn(
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder:(context, index) => const Divider(), 
            itemBuilder:(context, index) {
              return ListTile(
                onTap: () {
                  //Todo: debe navegar a editar al miembro seleccionado
                },
              leading:const CircleAvatar(
                child: Icon(Icons.diversity_3_rounded),
              ),
              title: Text(
                'User name data',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleMedium,
                ),
              subtitle: Text(
                'Parentesco user data',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing:const Icon(IconlyLight.arrow_right_2),
              );
            }, 
            ),
        ),
         )  
      ],
    ),
  ),
 );
 }
}