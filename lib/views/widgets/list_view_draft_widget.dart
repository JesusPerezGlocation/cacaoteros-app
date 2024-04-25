import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
lista de borradores sin enviar
*/
class ListViewHomeDraftWidget extends StatelessWidget {
  const ListViewHomeDraftWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
      itemCount: 3,
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      separatorBuilder: (context, index) => SizedBox(height: size.height * .01),
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
              /*navega a la pantalla de la lista de una encuesta */
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const DraftOfOneSurveysScreen(
                          color: PaletteColorsTheme.principalColor,
                          categorie: 'CATEGORIE NAME',
                        )),
              );
            },
          ),
        );
      },
    );
  }
}
