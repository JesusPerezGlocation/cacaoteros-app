import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  /*show modal para aceptar los terminos en visitas */
  static showModalVisitsTerm(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: PaletteColorsTheme.transparentColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const _ContainerShowModalTwo();
        });
  }
}

class _ContainerShowModalTwo extends StatefulWidget {
  const _ContainerShowModalTwo();

  @override
  State<_ContainerShowModalTwo> createState() => _ContainerShowModalTwoState();
}

class _ContainerShowModalTwoState extends State<_ContainerShowModalTwo> {
  bool isAcceptTerm = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    return Container(
      height: size.height * .8,
      width: size.width,
      decoration: const BoxDecoration(
          color: PaletteColorsTheme.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          const TitleAndCloseModal(title: 'Tratamiento de datos'),
          SizedBox(height: size.height * .02),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * .02),
              child: Text(
                '',
                maxLines: 30,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.headlineSmall,
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .02, vertical: size.height * .01),
              child: Text(
                'Yo ${visitsPrv.beneficiaryName.text} mayor de edad, identificado con la cedula de ciudadanía No. ${visitsPrv.beneficiaryNumDoc.text} de ${visitsPrv.placeExpeditions.text} de acuerdo con lo establecido en la Ley 1581 de 2012 y el Decreto Reglamentario 1377 de 2013, para el Tratamiento de datos personales y su régimen de protección, declaro de manera libre, expresa, inequívoca e informada, que AUTORIZO a LA FEDERACIÓN NACIONAL DE CACAOTEROS - FEDECACAO. para que, en los términos del literal a) del artículo 6 de la Ley 1581 de 2012, realice la recolección, almacenamiento, uso, circulación, supresión, suprima, comparta, actualice, transmita y en general realice el tratamiento de mis datos personales, incluyendo datos sensibles, como origen racial o étnico, mis huellas digitales, fotografías, videos y demás datos que puedan llegar a ser considerados como sensibles de conformidad con la Ley, para que dicho Tratamiento se realice con el fin de lograr las finalidades relativas a ser miembro o renovar la afiliación, participar en proyectos agrícolas, en actividades de capacitación, en programas de investigación, en programas de comercialización y mercadeo, en campañas de divulgación para lograr asimismo la verificación de información, antecedentes de todo orden, validación, registro, sin limitarse a ello de conformidad con los Estatutos que regulan a LA FEDERACIÓN NACIONAL DE CACAOTEROS - FEDECACAO, los requisitos convencionales y/o contractuales, y la Ley.',
                maxLines: 30,
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
                /*cambia el estado */
                setState(() => isAcceptTerm = true);
                /*acepta los terminos y condiciones */
                visitsPrv.setAcceptsTerm(isAcceptTerm);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _ContainerShowModalOne extends StatefulWidget {
  const _ContainerShowModalOne();

  @override
  State<_ContainerShowModalOne> createState() => _ContainerShowModalOneState();
}

class _ContainerShowModalOneState extends State<_ContainerShowModalOne> {
  bool isAcceptTerm = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
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
                /*cambia el estado */
                setState(() => isAcceptTerm = true);
                /*acepta los terminos y condiciones */
                surveysPrv.setIsAcceptTermAndConditions(isAcceptTerm);
              },
            ),
          )
        ],
      ),
    );
  }
}
