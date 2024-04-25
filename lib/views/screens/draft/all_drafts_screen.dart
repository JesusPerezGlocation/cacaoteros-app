import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';
import 'package:surveys_app/views/screens/draft/draft_of_one_survey_screen.dart';
/*
pantalla para ver todos los borradores almacenados
*/

class AllDraftsScreen extends StatelessWidget {
  const AllDraftsScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .03),
        child: FadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleSurveysComponents(
                  title: 'BORRADORES GUARDADOS',
                  color: PaletteColorsTheme.principalColor),
              SizedBox(height: size.height * .02),
              //Todo:!! descomentar y  mostrar cuando la lista venga vacia
              Expanded(
                  child: ListView.separated(
                itemCount: 3,
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
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
                        /*navega a la pantalla de la lista de una encuesta */
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DraftOfOneSurveysScreen(
                                    color: PaletteColorsTheme.principalColor,
                                    categorie: 'CATEGORIE NAME',
                                  )),
                        );
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
      ),
    );
  }
}
