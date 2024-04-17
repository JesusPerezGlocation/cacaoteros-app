// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla #5 GEOGRAFÍA DEL PREDIO
*/
class FiveSurveysScreen extends StatefulWidget {
  /*prv para obtener long y lat */
  final PermissionLocationProvider locationPRV;

  const FiveSurveysScreen({
    super.key,
    required this.locationPRV,
  });

  @override
  State<FiveSurveysScreen> createState() => _FiveSurveysScreenState();
}

class _FiveSurveysScreenState extends State<FiveSurveysScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  Future getCurrentPosition() async {
    widget.locationPRV.getLocationUser();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: const [SaveIconDraftComponents()],
      ),
      body: FadeIn(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .03, vertical: size.height * .03),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            const TitleSurveysComponents(
                title:
                    'INFORMACIÓN BÁSICA DEL CACAOCULTOR > GEOGRAFÍA DEL PREDIO'),
            SizedBox(height: size.height * .02),
            const LinealPercentComponent(
              percent: (5 - 1) * (100 / 23) / 100,
              questions: '30',
              answers: '5',
            ),
            SizedBox(height: size.height * .04),
            /*componente para mostrar la longitud y la latitud */
            FutureBuilder<void>(
              future: widget.locationPRV.getPermissionLocation(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingAppComponent();
                } else if (snapshot.hasError) {
                  return LatAndLongComponents(
                    data:
                        '${widget.locationPRV.latitude}, ${widget.locationPRV.longitude}',
                    onTap: () async {
                      setState(() {});
                      await widget.locationPRV.getPermissionLocation(context);
                    },
                  );
                } else {
                  return FadeIn(
                    child: LatAndLongComponents(
                      data:
                          '${widget.locationPRV.latitude}, ${widget.locationPRV.longitude}',
                      onTap: () async {
                        setState(() {});
                        await widget.locationPRV.getPermissionLocation(context);
                      },
                    ),
                  );
                }
              },
            ),

            SizedBox(height: size.height * .03),
            //#1 número de hectareas
            InputsComponent(
              title: 'Nombre de la finca',
              hintext: ' Ingresar nombre',
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .03),
            //#2 número de hectareas
            InputsComponent(
              title: 'Número de hectáreas del predio',
              hintext: ' Ingresar hectáreas',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: (val) => ValidationInputs.inputEmpty(val),
              onChanged: (val) {},
            ),
            SizedBox(height: size.height * .03),
            //#3 certificación
            DropdownComponents(
              title: '¿Tiene alguna certificación?',
              initialValue: 'CC',
              hintext: 'Seleccionar tipo de persona',
              items: const ['Si', 'No'],
              validator: (value) => ValidationInputs.inputTypeSelect(value),
              onChanged: (val) {},
            ),

            SizedBox(height: size.height * .06),

            /*boton para continuar*/
            ButtonComponents(
              title: 'Continuar',
              onPressed: () {
                //Todo: debe validar
                /*navega a la siguente pantalla*/
                Navigator.pushNamed(context, MainRoutes.sixSurveysRoute);
              },
            ),
            SizedBox(height: size.height * .06),
          ],
        ),
      ),
    );
  }
}
