import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
show modals para todo lo que tenga que ver con terminos y condiciones de la app 
*/
class TermAndConditionsShowModal {
  /*autorización de la firma*/
  static showModalAuthorization(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: PaletteColorsTheme.transparentColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const _ContainerShowModalOne();
        });
  }
}

class _ContainerShowModalOne extends StatelessWidget {
  const _ContainerShowModalOne();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .5,
      width: size.width,
      decoration: const BoxDecoration(
          color: PaletteColorsTheme.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const TitleAndCloseModal(title: 'AUTORIZACIÓN DE INFORMACIÓN'),
          SizedBox(height: size.height * .02),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .02, vertical: size.height * .01),
            child: Text(
              'Para todos los efectos, certifico que los datos por mí suministrados en la presente caracterización, son veraces.',
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .02, vertical: size.height * .01),
              child: Text(
                'Habeas data: En cumplimiento de la ley 1581 de 2012 y el Decreto 1377 de 2013, con la firma de este documento autorizo a la Federación Nacional de Cacaoteros para mantener y manejar la información contenida en esta encuesta para los fines de desarrollados en Fedecacao.',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall,
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .02, vertical: size.height * .01),
              child: Text(
                'Nota: Los datos suministrados en esta caracterización serán compartidos con las entidades pertinentes y vinculados al Proyecto ConCacao de Trazabilidad.',
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall,
              )),
          SizedBox(height: size.height * .04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * .02),
            child: ButtonComponents(
              colorButton: PaletteColorsTheme.secondaryColor,
              title: 'Aceptar',
              onPressed: () {
                //Todo: crear provider para el check, booleano y pasarlo aca en true y llamarlo en CheckbuttonComponent en twenty_three_screen
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
