import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
pantalla #6 para las visitas
*/
class SixSurveysVisitsScreen extends StatefulWidget {
  const SixSurveysVisitsScreen({super.key});

  @override
  State<SixSurveysVisitsScreen> createState() => _SixSurveysVisitsScreenState();
}

class _SixSurveysVisitsScreenState extends State<SixSurveysVisitsScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(actions: [
        SaveIconDraftComponents(
          color: PaletteColorsTheme.principalColor,
          onTap: () {},
        )
      ]),
      body: FadeIn(
        child: Form(
          key: formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .03),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          ),
        ),
      ),
    );
  }
}
