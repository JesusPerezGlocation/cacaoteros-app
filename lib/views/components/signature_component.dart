// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:signature/signature.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
componente para las firmas
*/
class SignatureComponentsProdcuts extends StatefulWidget {
  final BeneficiariesSurveysProvider provider;
  final GlobalKey<SignatureState> signatureKey;
  final String title;
  const SignatureComponentsProdcuts({
    super.key,
    required this.title,
    required this.signatureKey,
    required this.provider,
  });

  @override
  State<SignatureComponentsProdcuts> createState() =>
      _SignatureComponentsProdcutsState();
}

class _SignatureComponentsProdcutsState
    extends State<SignatureComponentsProdcuts> {
  /*contralador de la firma */
  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: PaletteColorsTheme.blackColor,
    exportBackgroundColor: PaletteColorsTheme.whiteColor,
  );

  /*transaformación a imagen */
  Uint8List? bytes;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .41,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * .02),
      decoration: BoxDecoration(
        color: PaletteColorsTheme.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: PaletteColorsTheme.blackColor.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .02, vertical: size.height * .02),
            child: Text(widget.title,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: PaletteColorsTheme.principalColor),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start),
          ),
          /*firma*/
          Signature(
            key: widget.signatureKey,
            controller: controller,
            width: size.width * .9,
            height: size.height * .26,
            backgroundColor: PaletteColorsTheme.greyColor,
          ),
          SizedBox(height: size.height * .01),
          Row(
            children: [
              SizedBox(
                child: OutlinedButton(
                    onPressed: () async {
                      bytes =
                          await controller.toPngBytes(width: 500, height: 500);
                      /*Verifica que bytes no sea nulo antes de continuar */
                      if (bytes != null) {
                        /*Convierte los bytes de la firma a Base64 */
                        String firmaBase64 = base64Encode(bytes!);
                        /*convierte la firma */
                        widget.provider.setSignatureProducts(firmaBase64);
                      }
                      setState(() {});

                      SnackBarGlobalWidget.showSnackBar(
                          context,
                          'Firma guardada con éxito!',
                          Icons.check_circle_outline_outlined,
                          PaletteColorsTheme.principalColor);
                    },
                    child: const Text('Guardar firma')),
              ),
              SizedBox(width: size.width * .02),
              IconButton(
                  onPressed: () {
                    bytes = null;
                    controller.clear();
                  },
                  icon: const Icon(IconlyLight.delete)),
            ],
          )
        ],
      ),
    );
  }
}

/*
firma del tecnico de campo
SignatureComponentTieldTechnician
*/

class SignatureComponentTieldTechnician extends StatefulWidget {
  final BeneficiariesSurveysProvider provider;
  final GlobalKey<SignatureState> signatureKey;
  final String title;
  const SignatureComponentTieldTechnician(
      {super.key,
      required this.provider,
      required this.signatureKey,
      required this.title});

  @override
  State<SignatureComponentTieldTechnician> createState() =>
      _SignatureComponentTieldTechnicianState();
}

class _SignatureComponentTieldTechnicianState
    extends State<SignatureComponentTieldTechnician> {
  /*contralador de la firma */
  SignatureController controller = SignatureController(
    penStrokeWidth: 3,
    penColor: PaletteColorsTheme.blackColor,
    exportBackgroundColor: PaletteColorsTheme.whiteColor,
  );

  /*transaformación a imagen */
  Uint8List? bytes;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .41,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * .02),
      decoration: BoxDecoration(
        color: PaletteColorsTheme.whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: PaletteColorsTheme.blackColor.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 20,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .02, vertical: size.height * .02),
            child: Text(widget.title,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: PaletteColorsTheme.principalColor),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start),
          ),
          /*firma*/
          Signature(
            key: widget.signatureKey,
            controller: controller,
            width: size.width * .9,
            height: size.height * .26,
            backgroundColor: PaletteColorsTheme.greyColor,
          ),
          SizedBox(height: size.height * .01),
          Row(
            children: [
              SizedBox(
                child: OutlinedButton(
                    onPressed: () async {
                      bytes =
                          await controller.toPngBytes(width: 500, height: 500);
                      /*Verifica que bytes no sea nulo antes de continuar */
                      if (bytes != null) {
                        /*Convierte los bytes de la firma a Base64 */
                        String firmaBase64 = base64Encode(bytes!);
                        /*convierte la firma */
                        widget.provider.setSignatureTecns(firmaBase64);
                      }
                      setState(() {});

                      SnackBarGlobalWidget.showSnackBar(
                          context,
                          'Firma guardada con éxito!',
                          Icons.check_circle_outline_outlined,
                          PaletteColorsTheme.principalColor);
                    },
                    child: const Text('Guardar firma')),
              ),
              SizedBox(width: size.width * .02),
              IconButton(
                  onPressed: () {
                    bytes = null;
                    controller.clear();
                  },
                  icon: const Icon(IconlyLight.delete)),
            ],
          )
        ],
      ),
    );
  }
}
