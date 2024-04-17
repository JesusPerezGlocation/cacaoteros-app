import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
/*
lista de borradores sin enviar
*/
class ListViewHomeDraftWidget extends StatelessWidget {
const ListViewHomeDraftWidget({super.key});
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return ListView.separated(
 itemCount: 14,
 physics: const BouncingScrollPhysics(),
 keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
 separatorBuilder:(context, index) => SizedBox(height: size.height*.02), 
 itemBuilder:(context, index) {
   /*retorna la lista de items */
   return  CardDraft(
    title: 'Title card data',
    date: 'day/month/year',
    onTap: (){
      //Todo: debe la opción de subir, eliminar y si ya está arriba debe eliminarse de la lista
    },
   );
 }, 
 );
 }
}

/*
card para retornar en la lista de borradores
*/
class CardDraft extends StatelessWidget {
final String title;
final String date;
final Function onTap;
const CardDraft({super.key, 
required this.title, 
required this.date, 
required this.onTap,
});
 @override
 Widget build(BuildContext context) {
 return Container(
  
  decoration: BoxDecoration(
    color:  PaletteColorsTheme.greyColor,
    borderRadius: BorderRadius.circular(15)
  ),
   child: ListTile(
   // tileColor: PaletteColorsTheme.greyColor,
   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    onTap: ()=> onTap(),
    title: Text(
    title,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
    style: Theme.of(context).textTheme.titleLarge,
    ),
    subtitle: Text(
    date,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start,
    style: Theme.of(context).textTheme.bodySmall,
    ),
    trailing:const Icon(IconlyLight.arrow_right_2),
   ),
 );
 }
}


