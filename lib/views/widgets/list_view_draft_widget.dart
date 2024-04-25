import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
lista de borradores sin enviar
*/
class ListViewHomeDraftWidget extends StatelessWidget {
  const ListViewHomeDraftWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
      itemCount: 3,
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      separatorBuilder: (context, index) => SizedBox(height: size.height * .01),
      itemBuilder: (context, index) {
        /*retorna la lista de items */
        return FadeIn(
          child: CardDraftComponents(
            title: 'Title card data',
            date: '22 Abril',
            categorie: 'Categore.data',
            icons: IconlyLight.arrow_right_2,
            colors: PaletteColorsTheme.principalColor,
            onTap: () {
              //Todo: debe la opción de subir, eliminar y si ya está arriba debe eliminarse de la lista
            },
          ),
        );
      },
    );
  }
}

/*
card para retornar en la lista de borradores
*/
class CardDraftComponents extends StatelessWidget {
  final String title;
  final String date;
  final Color colors;
  final IconData icons;
  final String categorie;
  final Function onTap;
  const CardDraftComponents({
    super.key,
    required this.title,
    required this.date,
    required this.categorie,
    required this.colors,
    required this.icons,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: PaletteColorsTheme.greyColor,
      onTap: () => onTap(),
      child: Container(
        height: size.height * .09,
        width: size.width,
        decoration: BoxDecoration(
          color: PaletteColorsTheme.greyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            /*fecha */
            Container(
              height: size.height,
              width: size.width * .13,
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * .02, vertical: size.height * .01),
              decoration: BoxDecoration(
                  color: colors.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                date,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: colors),
              )),
            ),
            SizedBox(
              width: size.width * .65,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*titulo */
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    categorie,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            Icon(icons, color: colors)
          ],
        ),
      ),
    );
  }
}
