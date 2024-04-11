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