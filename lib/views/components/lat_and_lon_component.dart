import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
/*
componente para mostrar la longitud y latitud al usuario
*/

class LatAndLongComponents extends StatelessWidget {
  final String data;
  final String secondData;
  final Function onTap;

  const LatAndLongComponents({
    super.key,
    required this.data,
    required this.onTap,
    required this.secondData,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .26,
      width: size.width,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .02, vertical: size.height * .01),
      decoration: BoxDecoration(
        color: PaletteColorsTheme.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: PaletteColorsTheme.blackColor.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 20,
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '  Tus coordenadas',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium,
            ),

            /*latitud y longitud*/
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(IconlyLight.location),
              title: Text(
                'Latitud y longitud',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                data,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(IconlyLight.location),
              title: Text(
                'Exactitud y Altitud',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              subtitle: Text(
                secondData,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ]),
          /*volver a cargar las coordenadas*/
          CircleAvatar(
            backgroundColor: PaletteColorsTheme.secondaryColor,
            child: IconButton(
                onPressed: () => onTap(),
                icon: const Center(
                    child: Icon(
                  Icons.replay_outlined,
                  color: PaletteColorsTheme.whiteColor,
                ))),
          ),
        ],
      ),
    );
  }
}
