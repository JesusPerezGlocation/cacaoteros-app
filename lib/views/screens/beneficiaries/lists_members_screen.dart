import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
pantalla para mostrar la lista de miembros añadidos en la pantalla #11
*/
class ListMembersScreen extends StatelessWidget {
  const ListMembersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPrv = Provider.of<BeneficiariesSurveysProvider>(context);
    return Scaffold(
      floatingActionButton:
          const IconButtonAddMemberComponents(isViewListMembers: false),
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleSurveysComponents(
                color: PaletteColorsTheme.secondaryColor,
                title: 'LISTA DE MIEMBROS'),
            SizedBox(height: size.height * .03),
            /*si la lista está vacia */
            if (surveysPrv.familyMembers.isEmpty ||
                surveysPrv.familyMembers == [])
              Center(
                child: IsEmptyWithImageComponents(
                  image: ImagesPaths.otherMembers,
                  title: 'No se hallaron nuevos miembros añadidos.',
                ),
              )
            else
              Expanded(
                child: FadeIn(
                  child: ListView.separated(
                    itemCount: surveysPrv.familyMembers.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      /*obtener el miembro de la familia en el índice actual */
                      final member = surveysPrv.familyMembers[index];

                      return ListTile(
                        onTap: () {
                          //Todo: debe navegar a editar al miembro seleccionado
                        },
                        leading: CircleAvatar(
                          backgroundColor: PaletteColorsTheme.secondaryColor,
                          child: Text(
                            member.name.substring(0, 1),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        title: Text(
                          member.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          member.documentNumber,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: const Icon(IconlyLight.arrow_right_2),
                      );
                    },
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
