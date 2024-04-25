import 'dart:developer';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';
import 'package:surveys_app/firebase_options.dart';

void main() async {
  /*inicializa fireabse */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /*solicita el permiso de tracking*/
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();

  log('permisos tracking: $status');
  runApp(const StateApp());
}

class StateApp extends StatelessWidget {
  const StateApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(
          create: (context) => NoConnectionEthernetProvider().controller.stream,
          initialData: NetworkStatus.online,
        ),
        /*provider para los permisos */
        ChangeNotifierProvider(
            create: (context) => PermissionLocationProvider()),
        /*encuesta de caracterización de beneficiarios */
        ChangeNotifierProvider(
            create: (context) => BeneficiariesSurveysProvider()),
        /*conexión a internet */
        ChangeNotifierProvider(
            create: (context) => NoConnectionEthernetProvider()),
        /*provider para la encuesta de visitas */
        ChangeNotifierProvider(create: (context) => VisitsSurveysProvider()),
        /*permisos de la camara */
        ChangeNotifierProvider(create: (context) => CameraPermissionProvider()),
        /*provuder para transfomar la imagen con dominio */
        ChangeNotifierProvider(create: (context) => SendImageApi()),
        /*obtiene la listas de sql */
        ChangeNotifierProvider(
            create: (context) => GetListDraftSurveysProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      // themeMode: ThemeMode.system,
      // darkTheme: MainTheme.blackTheme,
      theme: MainTheme.whiteTheme,
      routes: MainRoutes.routes,
      initialRoute: MainRoutes.initialRoute,
    );
  }
}
