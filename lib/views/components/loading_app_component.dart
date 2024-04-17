



import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

class LoadingAppComponent extends StatelessWidget {

const LoadingAppComponent({super.key});
 @override
 Widget build(BuildContext context) {
 
 return Center(
  child: LoadingAnimationWidget.fourRotatingDots(color: PaletteColorsTheme.principalColor, size: 50),
 );
 }
}