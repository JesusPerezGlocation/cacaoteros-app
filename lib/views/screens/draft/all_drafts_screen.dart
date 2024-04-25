import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
/*
pantalla para ver todos los borradores almacenados
*/

class AllDraftsScreen extends StatelessWidget {
  final Color color;
  const AllDraftsScreen({
    super.key,
    required this.color,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleSurveysComponents(title: 'BORRADORES GUARDADOS', color: color),
            SizedBox(height: size.height * .02),
            //Todo:!! descomentary  mostrar cuando la lista venga vacia
            Expanded(
                child: ListView.separated(
              itemCount: 3,
              physics: const BouncingScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              separatorBuilder: (context, index) =>
                  SizedBox(height: size.height * .01),
              itemBuilder: (context, index) {
                /*retorna la lista de items */
                return FadeIn(
                  child: CardDraftComponents(
                    title: 'Title card data',
                    date: '22 Abril',
                    categorie: 'Categore.data',
                    icons: IconlyLight.arrow_right_2,
                    colors: PaletteColorsTheme.principalColor,
                    onTap: () {
                      //Todo: debe la opción de subir, eliminar y si ya está arriba debe eliminarse de la lista
                    },
                  ),
                );
              },
            )),
            // Center(
            //   child: IsEmptyWithImageComponents(
            //     image: ImagesPaths.emptyDraft,
            //     title: 'No se hallaron resultados de borradores.',
            //   ),
            // )
            /*lista de borradores */
          ],
        ),
      ),
    );
  }
}
