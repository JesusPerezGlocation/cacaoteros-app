// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla para mostrarle al usuario que termino la en cuenta, si la quiere guardar como borrador o enviar 
*/
class EndSurveysScreen extends StatelessWidget {
  const EndSurveysScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
    final ethernetProvider = Provider.of<NetworkStatus>(context);
    return Scaffold(
        appBar: AppBar(),
        /*pregunta si tiene internet o no y muestra un widget otro */
        body: ethernetProvider == NetworkStatus.online
            ? _OnlineScreenComponents(surveysPrv: surveysPrv)
            : _OfflineScreenComponents(
                ethernetProvider: ethernetProvider,
                nameUnit: surveysPrv.nameUnit.text,
              ));
  }
}

/*
componente cuando el usuario tiene internet
*/
class _OnlineScreenComponents extends StatelessWidget {
  final BeneficiariesSurveysProvider surveysPrv;
  const _OnlineScreenComponents({
    required this.surveysPrv,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .03, vertical: size.height * .03),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        /*image*/
        SizedBox(
            height: size.height * .3,
            child: Image.asset(ImagesPaths.womanSend)),
        Text(
          surveysPrv.nameUnit.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: PaletteColorsTheme.secondaryColor),
        ),
        SizedBox(height: size.height * .005),
        Text(
          "No podrá realizar ediciones una vez que envíe. Si necesita hacer cambios, presione en 'Guardar como borrador' hasta que esté listo para enviar.",
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        /*pregunta si tiene internet y muestra el boton si lo tiene */
        SizedBox(height: size.height * .06),
        /*enviar a la base */
        ButtonComponents(
            colorButton: PaletteColorsTheme.secondaryColor,
            title: 'Enviar encuesta',
            onPressed: () async {
              ShowModalLoadingWidget.showLoadingView(context);
              /*envia la imagen a la base de datos*/
              await surveysPrv.sendImageSignature(context);
              /*enviar datos a firebase */
              await surveysPrv.sentSurveysToFirabase(context);
              /*envia el primer miembro */
              await surveysPrv.sentAddMembersToFirabase(context);
              /*envia si el usuario añadio más miembros*/
              await surveysPrv.sentAddListMembersToFirabase(context);

              Navigator.pop(context);

              /*navega al home*/
              Navigator.of(context).pushNamedAndRemoveUntil(
                MainRoutes.initialRoute,
                (route) => false,
              );
            }),
        SizedBox(height: size.height * .02),
        ButtonOutlineComponents(
            color: PaletteColorsTheme.secondaryColor,
            title: 'Guardar como borrador',
            onPressed: () async {
              //Todo: debe guardar el borrador en la base sql
              SnackBarGlobalWidget.showSnackBar(
                  context,
                  'En proceso de construcción',
                  Icons.error_outlined,
                  PaletteColorsTheme.yellowColor);
            }),
        SizedBox(height: size.height * .06),
      ],
    ).animate().fade().scale();
  }
}

/*sin conexión a internet*/
class _OfflineScreenComponents extends StatefulWidget {
  final NetworkStatus ethernetProvider;

  final String nameUnit;
  const _OfflineScreenComponents({
    required this.ethernetProvider,
    required this.nameUnit,
  });

  @override
  State<_OfflineScreenComponents> createState() =>
      _OfflineScreenComponentsState();
}

class _OfflineScreenComponentsState extends State<_OfflineScreenComponents> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .03, vertical: size.height * .03),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      children: [
        /*image*/
        SizedBox(
            height: size.height * .3,
            child: Image.asset(ImagesPaths.noConecction)),
        Text(
          widget.nameUnit,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: PaletteColorsTheme.secondaryColor),
        ),
        SizedBox(height: size.height * .005),
        Text(
          'Lo sentimos, parece que no tienes conexión a Internet en este momento. No te preocupes, ¡aún puedes completar la encuesta! Puedes guardar tus respuestas como borrador y enviarlas más tarde cuando tengas conexión.',
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: size.height * .02),
        ButtonOutlineComponents(
            color: PaletteColorsTheme.secondaryColor,
            title: 'Guardar como borrador',
            onPressed: () async {
              //Todo: debe guardar el borrador en la base sql
              SnackBarGlobalWidget.showSnackBar(
                  context,
                  'En proceso de construcción',
                  Icons.error_outlined,
                  PaletteColorsTheme.yellowColor);
            }),
        SizedBox(height: size.height * .06),
      ],
    ).animate().fade().scale();
  }
}
