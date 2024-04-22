import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
/*
pantalla para ver todos los borradores almacenados
*/

class AllDraftsScreen extends StatelessWidget {
  const AllDraftsScreen({super.key});
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
            const TitleSurveysComponents(
                title: 'BORRADORES GUARDADOS',
                color: PaletteColorsTheme.secondaryColor),
            SizedBox(height: size.height * .02),
            Center(
              child: IsEmptyWithImageComponents(
                image: ImagesPaths.emptyDraft,
                title: 'No se hallaron resultados de borradores.',
              ),
            )
            /*lista de borradores */
            //Todo: no debe tener el filtro de cantidad, aca se deben mostrar todos
          ],
        ),
      ),
    );
  }
}
