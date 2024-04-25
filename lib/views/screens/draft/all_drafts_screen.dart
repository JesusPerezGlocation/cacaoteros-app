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
              /*future para obtener los datos*/

              FutureBuilder<List<DraftSurveysListModel>>(
                future: ListDraftAllSurveysSQL.instance.getAllSurveysGet(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingAppComponent(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: IsEmptyDataComponent(
                        title:
                            'Error al obtener la lista: ${snapshot.hasError}',
                      ),
                    );
                  } else {
                    List<DraftSurveysListModel> surveys = snapshot.data!;

                    if (surveys.isEmpty) {
                      return Center(
                        child: IsEmptyWithImageComponents(
                          image: ImagesPaths.emptyDraft,
                          title: 'No se hallaron resultados de borradores.',
                        ),
                      );
                    } else {
                      return Expanded(
                          child: ListView.separated(
                        itemCount: surveys.length,
                        physics: const BouncingScrollPhysics(),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: size.height * .01),
                        itemBuilder: (context, index) {
                          final data = surveys[index];
                          /*retorna la lista de items */
                          return FadeIn(
                            child: CardDraftComponents(
                              id: data.id,
                              title: data.title,
                              date: data.date,
                              categorie: data.categorie,
                              icons: IconlyLight.arrow_right_2,
                              colors: data.colors,
                              onTap: () {
                                /*navega a la pantalla de la lista de una encuesta */
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DraftOfOneSurveysScreen(
                                            color: PaletteColorsTheme
                                                .principalColor,
                                            categorie: 'CATEGORIE NAME',
                                          )),
                                );
                              },
                            ),
                          );
                        },
                      ));
                    }
                  }
                },
              ),
              //Todo:!! descomentar y  mostrar cuando la lista venga vacia

              /*lista de borradores */
            ],
          ),
        ),
      ),
    );
  }
}
