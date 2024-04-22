import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla para mostrar la primera encuesta
*/
class HomeSurveysScreen extends StatefulWidget {
  const HomeSurveysScreen({super.key});

  @override
  State<HomeSurveysScreen> createState() => _HomeSurveysScreenState();
}

class _HomeSurveysScreenState extends State<HomeSurveysScreen> {
  /*calcula la fecha de hoy */
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PermissionLocationProvider().getPermissionLocation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ethernetProvider = Provider.of<NetworkStatus>(context);
    final statusPrv = Provider.of<NoConnectionEthernetProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: HomeAppBarComponents(
          ethernetProvider: ethernetProvider,
          statusPrv: statusPrv,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .03),
        child: Column(
          children: [
            /*componente para llenar las encuestas*/
            SizedBox(
              height: size.height * .25,
              width: size.width,
              child: ListSurveysHomeComponents(dateTime: dateTime),
            ),
            SizedBox(height: size.height * .03),
            /*ver todos los borradores*/
            ViewAllDraftComponents(
                title: 'Borradores',
                action: 'Ver todos',
                onTap: () {
                  /*navega a ver todos los borradores */
                  Navigator.pushNamed(context, MainRoutes.allDraftsRoute);
                }),

            /*lista de borradores*/
            const Expanded(
              child: ListViewHomeDraftWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
