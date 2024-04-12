import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

void main() {
  runApp(const StateApp());
}


class StateApp extends StatelessWidget {
  const StateApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /*provider para manejar el gestor de estado de las preguntas */
        ChangeNotifierProvider(
            create: (context) => SurveysQuestionsProvider()),
      
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

 