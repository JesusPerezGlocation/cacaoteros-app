import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconly/iconly.dart';
import 'package:signature/signature.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
componente para las firmas
*/
class SignatureComponents extends StatefulWidget {
  final String title;
  const SignatureComponents({
    super.key,
    required this.title,
  });

  @override
  State<SignatureComponents> createState() => _SignatureComponentsState();
}

class _SignatureComponentsState extends State<SignatureComponents> {
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

  final GlobalKey<SignatureState> signatureKey = GlobalKey<SignatureState>();

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
            key: signatureKey,
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
                    onPressed: () {
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
                    //Todo: debe eliminar la firma
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
