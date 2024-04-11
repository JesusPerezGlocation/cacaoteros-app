import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

class HomeAppBarComponents extends StatelessWidget {

const HomeAppBarComponents({super.key});
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return Row(
  children: [
    CircleAvatar(
      backgroundImage: AssetImage(ImagesPaths.logo),
    ),
    SizedBox(width: size.width*.02),
    const Text('Registro de visitas',
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.start, 
   
    ),
  

  ],
 );
 }
}