// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
final de la encuesta para las visitas
*/
class EndSurveysVisitsScreen extends StatelessWidget {
  const EndSurveysVisitsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final ethernetProvider = Provider.of<NetworkStatus>(context);
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<NetworkStatus>(
        builder: (context, value, child) {
          /*si esta conectado a internet */
          if (value == NetworkStatus.offline) {
            return OfflineEndSurveysComponents(
              title: visitsPrv.beneficiaryName.text,
              description:
                  'Lo sentimos, parece que no tienes conexión a Internet en este momento. No te preocupes, ¡aún puedes completar la encuesta! Puedes guardar tus respuestas como borrador y enviarlas más tarde cuando tengas conexión.',
              onTap: () {},
            );
          } else {
            return OnlineEndSurveysComponents(
              title: visitsPrv.beneficiaryName.text,
              description:
                  "No podrá realizar ediciones una vez que envíe. Si necesita hacer cambios, presione en 'Guardar como borrador' hasta que esté listo para enviar.",
              onSendData: () async {
                /*muestra un loading*/
                ShowModalLoadingWidget.showLoadingView(context);

                await visitsPrv.sendDataVisitsFirebase(context);

                Navigator.pop(context);
                /*navega al home*/
                Navigator.of(context).pushNamedAndRemoveUntil(
                  MainRoutes.initialRoute,
                  (route) => false,
                );
              },
              onDraft: () {},
            );
          }
        },
      ),
    );
  }
}
