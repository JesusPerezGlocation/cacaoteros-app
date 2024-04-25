import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

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
