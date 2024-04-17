import 'package:flutter/material.dart';
/*
titulos para las encuentas 
*/
class TitleSurveysComponents extends StatelessWidget {
  final String title;
  final int? maxLine;
const TitleSurveysComponents({super.key, 
required this.title, 
this.maxLine,
});
 @override
 Widget build(BuildContext context) {
 return  Text(
      title, 
      maxLines:maxLine?? 4,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: Theme.of(context).textTheme.titleLarge,
      );
 }
}


class TitleAndCloseModal extends StatelessWidget {
  final String title;
const TitleAndCloseModal({super.key, required this.title});
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return  ListTile(
        contentPadding: EdgeInsets.only(right:size.width*.02, left: size.width*.04),
        leading: Text(
        title,                
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: Theme.of(context).textTheme.titleLarge,),
        trailing: IconButton(onPressed: ()=> Navigator.pop(context), icon:const Icon(Icons.close_outlined)),
      );
 }
}