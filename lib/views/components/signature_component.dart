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
                    .copyWith(color: PaletteColorsTheme.secondaryColor),
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
              if (widget.provider.signatureProducts.isEmpty)
                SizedBox(
                  child: OutlinedButton(
                      style: const ButtonStyle(
                          side: MaterialStatePropertyAll(BorderSide(
                              color: PaletteColorsTheme.secondaryColor,
                              width: 1)),
                          foregroundColor: MaterialStatePropertyAll(
                              PaletteColorsTheme.secondaryColor)),
                      onPressed: () async {
                        bytes = await controller.toPngBytes(
                            width: 500, height: 500);
                        /*Verifica que bytes no sea nulo antes de continuar */
                        if (bytes != null) {
                          /*Convierte los bytes de la firma a Base64 */
                          String firmaBase64 = base64Encode(bytes!);
                          /*convierte la firma */
                          widget.provider.setSignatureProducts(firmaBase64);
                        }
                        setState(() {});

                        // /*envia la imagen a la base de datos*/
                        // await widget.provider.sendImageSignature(context);

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
                    widget.provider.deleteSignatureProduct();
                  },
                  icon: const Icon(
                    IconlyLight.delete,
                    color: PaletteColorsTheme.secondaryColor,
                  )),
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
                    .copyWith(color: PaletteColorsTheme.secondaryColor),
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
              if (widget.provider.signatureTecns.isEmpty)
                SizedBox(
                  child: OutlinedButton(
                      style: const ButtonStyle(
                          side: MaterialStatePropertyAll(BorderSide(
                              color: PaletteColorsTheme.secondaryColor,
                              width: 1)),
                          foregroundColor: MaterialStatePropertyAll(
                              PaletteColorsTheme.secondaryColor)),
                      onPressed: () async {
                        bytes = await controller.toPngBytes(
                            width: 500, height: 500);
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
                    widget.provider.deleteSignatureTecns();
                  },
                  icon: const Icon(
                    IconlyLight.delete,
                    color: PaletteColorsTheme.secondaryColor,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

/*
componente para la firma de visitas o cualquier otro
*/

class SignatureDrawComponents extends StatefulWidget {
  final String title;
  final Color color;
  final GlobalKey<SignatureState> signatureKey;
  final Function(String val) onSet;
  const SignatureDrawComponents({
    super.key,
    required this.title,
    required this.color,
    required this.signatureKey,
    required this.onSet,
  });

  @override
  State<SignatureDrawComponents> createState() =>
      _SignatureDrawComponentsState();
}

class _SignatureDrawComponentsState extends State<SignatureDrawComponents> {
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
                    .copyWith(color: widget.color),
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
                    style: ButtonStyle(
                        side: MaterialStatePropertyAll(
                            BorderSide(color: widget.color, width: 1)),
                        foregroundColor:
                            MaterialStatePropertyAll(widget.color)),
                    onPressed: () async {
                      bytes =
                          await controller.toPngBytes(width: 500, height: 500);
                      /*Verifica que bytes no sea nulo antes de continuar */
                      if (bytes != null) {
                        /*Convierte los bytes de la firma a Base64 */
                        String firmaBase64 = base64Encode(bytes!);
                        /*convierte la firma */
                        widget.onSet(firmaBase64);
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
                  icon: Icon(
                    IconlyLight.delete,
                    color: widget.color,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
