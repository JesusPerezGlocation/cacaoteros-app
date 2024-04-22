import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
loading global para app
*/
class LoadingAppComponent extends StatelessWidget {
  const LoadingAppComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots(
          color: PaletteColorsTheme.principalColor, size: 50),
    );
  }
}

/*
componente mientras carga el mapa
*/
class LoadingMapsComponents extends StatelessWidget {
  const LoadingMapsComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const LoadingAppComponent(),
        SizedBox(height: size.height * .01),
        Text(
          'Estamos cargando el mapa...',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          'Cargando el mapa para que puedas señalar los puntos importantes',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    ).animate().fade().scale();
  }
}
