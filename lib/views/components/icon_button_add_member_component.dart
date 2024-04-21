import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
boton para la pantalla #11 para añadir miembro
*/
class IconButtonAddMemberComponents extends StatelessWidget {
  final bool isViewListMembers;
  const IconButtonAddMemberComponents({
    super.key,
    required this.isViewListMembers,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
    return IconButton(
        onPressed: () {
          /*si viene desde los input de pantalla 4 muestra la lista, si lo lleva al pantalla add un nuevo miembro*/
          if (isViewListMembers) {
            /*abre la lista de miembros */
            Navigator.pushNamed(
              context,
              MainRoutes.listMembersRoute,
            );
          } else {
            /*limpia los inputs */
            surveysPrv.cleanInputsMembers();
            /*abre la pantalla de add un nuevo miembro */
            Navigator.pushNamed(
              context,
              MainRoutes.newMemberRoute,
            );
          }
        },
        icon: Ink(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: PaletteColorsTheme.blackColor.withOpacity(0.1),
                offset: const Offset(0, 1),
                blurRadius: 20,
              )
            ],
          ),
          child: CircleAvatar(
              backgroundColor: PaletteColorsTheme.whiteColor,
              radius: size.height * .035,
              child: const Icon(
                Icons.person_add_alt_outlined,
                size: 30,
                color: PaletteColorsTheme.principalColor,
              )),
        )).animate().fade().scale();
  }
}
