import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
/*
componente para los widget o listas vacias 
 */
class IsEmptyDataComponent extends StatelessWidget {
  final String title;
  final IconData? icon;
const IsEmptyDataComponent({super.key, required this.title, this.icon});
 @override
 Widget build(BuildContext context) {
 final size = MediaQuery.of(context).size;
 return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
      Icon(icon?? IconlyLight.folder,color: PaletteColorsTheme.blackColor, size: 70),
      SizedBox(height: size.height*.01),
    Text(title, 
              maxLines: 4,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w100)),
  ],
 );
 }
}