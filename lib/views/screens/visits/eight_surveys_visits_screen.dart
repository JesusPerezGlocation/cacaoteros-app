import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
pantalla #8 para las visitas 
*/
class EightSurveysVisitsScreen extends StatefulWidget {
  const EightSurveysVisitsScreen({super.key});

  @override
  State<EightSurveysVisitsScreen> createState() =>
      _EightSurveysVisitsScreenState();
}

class _EightSurveysVisitsScreenState extends State<EightSurveysVisitsScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  final GlobalKey<SignatureState> signatureKey = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          SaveIconDraftComponents(
            icon: IconlyLight.bookmark,
            color: PaletteColorsTheme.principalColor,
            onTap: () {},
          )
        ],
      ),
      body: FadeIn(
        child: Form(
          key: formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .03, vertical: size.height * .03),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              const TitleSurveysComponents(
                  title: 'AUTORIZACIÓN TRATAMIENTO DE DATOS PERSONALES',
                  color: PaletteColorsTheme.principalColor),
              SizedBox(height: size.height * .02),
              const LinealPercentComponent(
                colorOne: PaletteColorsTheme.principalColor,
                colorTwo: PaletteColorsTheme.principalColor,
                percent: (8 - 1) * (100 / 8) / 100,
                questions: '8',
                answers: '8',
              ),
              SizedBox(height: size.height * .04),
              Text(
                'Yo ${visitsPrv.beneficiaryName.text}, mayor de edad, identificado con la cédula de ciudadanía No. ${visitsPrv.beneficiaryNumDoc.text}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: size.height * .04),
              //#1
              InputsComponent(
                title: 'Ingresar lugar de expedición',
                hintext: ' Ingresar lugar',
                colorInputs: PaletteColorsTheme.principalColor,
                controller: visitsPrv.placeExpeditions,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => visitsPrv.setplaceExpeditions(val),
              ),
              SizedBox(height: size.height * .04),
              //#2
              InputsComponent(
                title: 'Ingresar dirección',
                hintext: '',
                colorInputs: PaletteColorsTheme.principalColor,
                maxLine: 3,
                controller: visitsPrv.addresBeneficiary,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => visitsPrv.setaddresBeneficiary(val),
              ),
              SizedBox(height: size.height * .04),
              //#3
              InputsDatesComponent(
                title: 'Ingresar número de teléfono',
                hintext: ' Ingresar número',
                keyboardType: TextInputType.number,
                maxLength: 10,
                colorInputs: PaletteColorsTheme.principalColor,
                controller: visitsPrv.numberPhone,
                validator: (val) => ValidationInputs.validatePhoneNumber(val),
                onChanged: (val) => visitsPrv.setnumberPhone(val),
              ),
              SizedBox(height: size.height * .04),
              //#4
              SignatureDrawComponents(
                title: 'Ingresar firma',
                color: PaletteColorsTheme.principalColor,
                signatureKey: signatureKey,
                isViewButton: visitsPrv.signature.isEmpty ? true : false,
                onSet: (val) => visitsPrv.setSignature(val),
                onDelete: () => visitsPrv.setdeleteSignature(),
              ),
              SizedBox(height: size.height * .02),
              //#5
              CheckbuttonComponent(
                title: 'Aceptar tratamientos de datos',
                check: visitsPrv.isAcceptsTerm,
                colorButton: PaletteColorsTheme.principalColor,
                onPressed: () =>
                    TermAndConditionsShowModal.showModalVisitsTerm(context),
              ),

              SizedBox(height: size.height * .01),
              //button
              ButtonComponents(
                title: 'Continuar',
                colorButton: PaletteColorsTheme.principalColor,
                onPressed: () {},
              ),
              SizedBox(height: size.height * .06),
            ],
          ),
        ),
      ),
    );
  }
}
