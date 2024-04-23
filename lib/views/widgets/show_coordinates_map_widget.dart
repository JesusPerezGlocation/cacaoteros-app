import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
muestra la lista de coordenadas dibujadas en la pantalla #4 de 
encuesta de visitas, en el mapa
*/
class ShowCoordinatesMapWidget {
  static showShowCoordinates(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: PaletteColorsTheme.transparentColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const _ContainerShowModal();
        });
  }
}

class _ContainerShowModal extends StatelessWidget {
  const _ContainerShowModal();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mapProvider = Provider.of<PermissionLocationProvider>(context);
    return Container(
      height: size.height * .6,
      width: size.width,
      decoration: const BoxDecoration(
          color: PaletteColorsTheme.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          const TitleAndCloseModal(title: 'Coordenadas seleccionadas'),
          SizedBox(height: size.height * .01),
          /*si la lista está vacia retorna un componente predeterminado con un assets */
          if (mapProvider.selectedCoordinates.isEmpty)
            IsEmptyWithImageComponents(
                image: ImagesPaths.noCoordinates,
                title: 'No se encontraron coordenadas añadidas.')
          else
            Expanded(
              child: ListView.separated(
                itemCount: mapProvider.selectedCoordinates.length,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                    left: size.width * .03,
                    right: size.width * .03,
                    bottom: size.height * .06),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final coordinate = mapProvider.selectedCoordinates[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      '${coordinate.latitude}, ${coordinate.longitude}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    leading: const Icon(IconlyLight.location),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
