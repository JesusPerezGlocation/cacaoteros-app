// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(),
      /*pregunta si tiene internet o no y muestra un widget otro */
      body: Consumer<NetworkStatus>(
        builder: (context, value, _) {
          /*si esta conectado a internet */
          if (value == NetworkStatus.online) {
            return OnlineEndSurveysComponents(
              title: surveysPrv.nameUnit.text,
              description:
                  "No podrá realizar ediciones una vez que envíe. Si necesita hacer cambios, presione en 'Guardar como borrador' hasta que esté listo para enviar.",
              onSendData: () async {
                ShowModalLoadingWidget.showLoadingView(context);
                /*envia la imagen a la base de datos de productor y tecnico*/
                await surveysPrv.sendImageSignatureProduct(context);
                await surveysPrv.sendImageSignatureTecnh(context);
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
              },
              onDraft: () async {
                /*setea el modelo con los campos  de la encuesta*/
                final dates = DraftSurveysListModel(
                  id: surveysPrv.idSurveys,
                  title: surveysPrv.nameUnit.text,
                  date: surveysPrv.dateCreateSurvey,
                  categorie: surveysPrv.categorieSurveys,
                );

                /*guarda los datos en la base SQL*/
                await ListDraftAllSurveysSQL.instance
                    .insertAllSurveys([dates], context);

                /*navega al home*/
                Navigator.of(context).pushNamedAndRemoveUntil(
                  MainRoutes.initialRoute,
                  (route) => false,
                );
              },
            );
          } else {
            return OfflineEndSurveysComponents(
              title: surveysPrv.nameUnit.text,
              description:
                  'Lo sentimos, parece que no tienes conexión a Internet en este momento. No te preocupes, ¡aún puedes completar la encuesta! Puedes guardar tus respuestas como borrador y enviarlas más tarde cuando tengas conexión.',
              onDraft: () async {
                /*setea el modelo con los campos  de la encuesta*/
                final dates = DraftSurveysListModel(
                  id: surveysPrv.idSurveys,
                  title: surveysPrv.nameUnit.text,
                  date: surveysPrv.dateCreateSurvey,
                  categorie: surveysPrv.categorieSurveys,
                );

                /*guarda los datos en la base SQL*/
                await ListDraftAllSurveysSQL.instance
                    .insertAllSurveys([dates], context);

                /*navega al home*/
                Navigator.of(context).pushNamedAndRemoveUntil(
                  MainRoutes.initialRoute,
                  (route) => false,
                );
              },
            );
          }
        },
      ),
    );
  }
}
