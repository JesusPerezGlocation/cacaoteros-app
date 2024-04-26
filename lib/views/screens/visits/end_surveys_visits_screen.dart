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
    // final ethernetProvider = Provider.of<NoConnectionEthernetProvider>(context);
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
              /*BORRADOR */
              onDraft: () async {
                /*setea el modelo con los campos  de la encuesta*/
                final dates = DraftSurveysListModel(
                  id: visitsPrv.idSurveys,
                  title: visitsPrv.beneficiaryName.text,
                  date: visitsPrv.dateCreateSurvey,
                  categorie: visitsPrv.categorieSurveys,
                );

                /*guarda la lista de visitas > encuesta visitas*/
                final visits = VisitsSurveysModels(
                  listID: visitsPrv.idSurveys.toString(),
                  percent: visitsPrv.percent,
                  categorieSurveys: visitsPrv.categorieSurveys,
                  submitterName: 'iPhoneUser',
                  submitterID: "99",
                  start: visitsPrv.dateCreateSurvey,
                  ubicacionBeneficiarioBeneficiario:
                      visitsPrv.beneficiaryName.text,
                  ubicacionBeneficiarioCedula: visitsPrv.beneficiaryNumDoc.text,
                  ubicacionTecnicoFecha: visitsPrv.dateTimeSurveys,
                  metainstanceID: 'uuid:${visitsPrv.metaInstanceUIID}',
                  ubicacionUbicacionFincaDepartamento:
                      visitsPrv.selectDepartment.text,
                  ubicacionUbicacionFincaCodigoDepartamento:
                      visitsPrv.codeDepartament.text,
                  ubicacionUbicacionFincaMunicipio:
                      visitsPrv.selectMunicipality.text,
                  ubicacionUbicacionFincaCodigoMunicipio:
                      visitsPrv.codeMunicipality.text,
                  ubicacionUbicacionFincaVereda: visitsPrv.place.text,
                  ubicacionUbicacionFincaCodigoVereda: visitsPrv.codePlace.text,
                  ubicacionInformacionFincaNombreFinca: visitsPrv.nameFarm.text,
                  ubicacionInformacionFincaAreaFinca: visitsPrv.areaFarm.text,
                  ubicacionInformacionFincaAreaCacao:
                      visitsPrv.areaCocoaFarm.text,
                  coordenadasPoligono: visitsPrv.latLngString,
                  startGeopointLatitude: visitsPrv.latitude,
                  startGeopointLongitude: visitsPrv.longitude,
                  startGeopointAccuracy: visitsPrv.accuracy,
                  startGeopointAltitude: visitsPrv.altitude,
                  situacionActualVisitaObjetivoVisita:
                      visitsPrv.objectiveVisit.text,
                  situacionActualVisitaDescripcionProyecto:
                      visitsPrv.situationFound.text,
                  situacionActualVisitaRecomendaciones:
                      visitsPrv.recomendations.text,
                  situacionActualVisitaCompromisos:
                      visitsPrv.beneficiaryCommitment.text,
                  firmasFirmaAgricultor: visitsPrv.signatureBeneficiary,
                  firmasFirmaTecnico: visitsPrv.signatureTecns,
                  registroFotograficoFotoRegistro: visitsPrv.selectImage,
                  datosPersonalesLugar: visitsPrv.placeExpeditions.text,
                  datosPersonalesDireccion: visitsPrv.addresBeneficiary.text,
                  datosPersonalesTelefono: visitsPrv.numberPhone.text,
                  datosPersonalesFirma: visitsPrv.signature,
                  end: visitsPrv.endSurveys,
                  ubicacionInformacionFincaVisita: '',
                  datosPersonalesFechaNota: '',
                  datosPersonalesNota: '',
                  datosPersonalesNota3: '',
                  datosPersonalesNota4: '',
                  ubicacionTecnicoNotaInicial: '',
                  ubicacionTecnicoFechaNota: '',
                );

                /*guarda los datos en la base SQL*/
                await ListDraftAllSurveysSQL.instance
                    .insertAllSurveys([dates], context);

                /*guarda la visita en la base depiendo del ID*/
                await VisitsRegisterSQLServices.instance
                    .insertVisitsRegister(visits, context);
                /*navega al home*/
                Navigator.of(context).pushNamedAndRemoveUntil(
                  MainRoutes.initialRoute,
                  (route) => false,
                );
              },
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
              /*BORRADOR */
              onDraft: () async {
                /*setea el modelo con los campos  de la encuesta*/
                final dates = DraftSurveysListModel(
                  id: visitsPrv.idSurveys,
                  title: visitsPrv.beneficiaryName.text,
                  date: visitsPrv.dateCreateSurvey,
                  categorie: visitsPrv.categorieSurveys,
                );
                /*guarda la lista de visitas > encuesta visitas*/
                final visits = VisitsSurveysModels(
                  listID: visitsPrv.idSurveys.toString(),
                  percent: visitsPrv.percent,
                  categorieSurveys: visitsPrv.categorieSurveys,
                  submitterName: 'iPhoneUser',
                  submitterID: "99",
                  start: visitsPrv.dateCreateSurvey,
                  ubicacionBeneficiarioBeneficiario:
                      visitsPrv.beneficiaryName.text,
                  ubicacionBeneficiarioCedula: visitsPrv.beneficiaryNumDoc.text,
                  ubicacionTecnicoFecha: visitsPrv.dateTimeSurveys,
                  metainstanceID: 'uuid:${visitsPrv.metaInstanceUIID}',
                  ubicacionUbicacionFincaDepartamento:
                      visitsPrv.selectDepartment.text,
                  ubicacionUbicacionFincaCodigoDepartamento:
                      visitsPrv.codeDepartament.text,
                  ubicacionUbicacionFincaMunicipio:
                      visitsPrv.selectMunicipality.text,
                  ubicacionUbicacionFincaCodigoMunicipio:
                      visitsPrv.codeMunicipality.text,
                  ubicacionUbicacionFincaVereda: visitsPrv.place.text,
                  ubicacionUbicacionFincaCodigoVereda: visitsPrv.codePlace.text,
                  ubicacionInformacionFincaNombreFinca: visitsPrv.nameFarm.text,
                  ubicacionInformacionFincaAreaFinca: visitsPrv.areaFarm.text,
                  ubicacionInformacionFincaAreaCacao:
                      visitsPrv.areaCocoaFarm.text,
                  coordenadasPoligono: visitsPrv.latLngString,
                  startGeopointLatitude: visitsPrv.latitude,
                  startGeopointLongitude: visitsPrv.longitude,
                  startGeopointAccuracy: visitsPrv.accuracy,
                  startGeopointAltitude: visitsPrv.altitude,
                  situacionActualVisitaObjetivoVisita:
                      visitsPrv.objectiveVisit.text,
                  situacionActualVisitaDescripcionProyecto:
                      visitsPrv.situationFound.text,
                  situacionActualVisitaRecomendaciones:
                      visitsPrv.recomendations.text,
                  situacionActualVisitaCompromisos:
                      visitsPrv.beneficiaryCommitment.text,
                  firmasFirmaAgricultor: visitsPrv.signatureBeneficiary,
                  firmasFirmaTecnico: visitsPrv.signatureTecns,
                  registroFotograficoFotoRegistro: visitsPrv.selectImage,
                  datosPersonalesLugar: visitsPrv.placeExpeditions.text,
                  datosPersonalesDireccion: visitsPrv.addresBeneficiary.text,
                  datosPersonalesTelefono: visitsPrv.numberPhone.text,
                  datosPersonalesFirma: visitsPrv.signature,
                  end: visitsPrv.endSurveys,
                  ubicacionInformacionFincaVisita: '',
                  datosPersonalesFechaNota: '',
                  datosPersonalesNota: '',
                  datosPersonalesNota3: '',
                  datosPersonalesNota4: '',
                  ubicacionTecnicoNotaInicial: '',
                  ubicacionTecnicoFechaNota: '',
                );
                /*guarda los datos en la base SQL*/
                await ListDraftAllSurveysSQL.instance
                    .insertAllSurveys([dates], context);

                /*guarda la visita en la base depiendo del ID*/
                await VisitsRegisterSQLServices.instance
                    .insertVisitsRegister(visits, context);

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
