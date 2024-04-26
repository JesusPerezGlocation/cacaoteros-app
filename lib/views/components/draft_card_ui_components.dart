import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
card para retornar en la lista de borradores de una encuesta
*/
class CardDraftOneSurveyComponents extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final IconData icons;
  final double percent;
  final Function onTap;
  const CardDraftOneSurveyComponents({
    super.key,
    required this.title,
    required this.date,
    required this.icons,
    required this.percent,
    required this.onTap,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: PaletteColorsTheme.greyColor.withOpacity(0.4),
      onTap: () => onTap(),
      child: Container(
        height: size.height * .1,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.width * .02),
        decoration: BoxDecoration(
          color: PaletteColorsTheme.greyColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*porcentaje completado*/
            SizedBox(
              child: CircularPercentIndicator(
                radius: 25,
                percent: percent,
                circularStrokeCap: CircularStrokeCap.round,
                lineWidth: 6.0,
                center: Text(
                  '$percent%',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                backgroundColor:
                    PaletteColorsTheme.principalColor.withOpacity(0.1),
                linearGradient: LinearGradient(colors: [
                  PaletteColorsTheme.principalColor,
                  PaletteColorsTheme.principalColor.withOpacity(0.4),
                ]),
              ),
            ),
            SizedBox(width: size.width * .02),
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
                    date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ),
            Icon(icons)
          ],
        ),
      ),
    );
  }
}

/*
card para retornar en la lista de borradores
*/
class CardDraftComponents extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final IconData icons;
  final String categorie;
  final Function onTap;
  const CardDraftComponents({
    super.key,
    required this.title,
    required this.date,
    required this.categorie,
    required this.icons,
    required this.onTap,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
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
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .002, vertical: size.height * .002),
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * .02, vertical: size.height * .01),
              decoration: BoxDecoration(
                  color: PaletteColorsTheme.principalColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                date.substring(0, 10),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: PaletteColorsTheme.whiteColor, fontSize: 10),
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
                    style: Theme.of(context).textTheme.bodyMedium!,
                  )
                ],
              ),
            ),
            Icon(icons, color: PaletteColorsTheme.principalColor)
          ],
        ),
      ),
    );
  }
}
