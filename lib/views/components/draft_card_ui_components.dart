import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
card para retornar en la lista de borradores de una encuesta
*/

class CardDraftOneSurveyComponents extends StatelessWidget {
  final String title;
  final String date;
  final Color colors;
  final IconData icons;
  final double percent;
  final Function onTap;
  const CardDraftOneSurveyComponents({
    super.key,
    required this.title,
    required this.date,
    required this.colors,
    required this.icons,
    required this.percent,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: colors.withOpacity(0.4),
      onTap: () => onTap(),
      child: Container(
        height: size.height * .1,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: size.width * .02),
        decoration: BoxDecoration(
          color: colors.withOpacity(0.3),
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
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: colors),
                ),
                backgroundColor: colors.withOpacity(0.1),
                linearGradient: LinearGradient(colors: [
                  colors,
                  colors.withOpacity(0.4),
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
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: colors),
                  ),
                  Text(
                    date,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: colors),
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
      borderRadius: BorderRadius.circular(15),
      splashColor: colors.withOpacity(0.4),
      onTap: () => onTap(),
      child: Container(
        height: size.height * .09,
        width: size.width,
        decoration: BoxDecoration(
          color: colors.withOpacity(0.3),
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
                  color: colors, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                date,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: PaletteColorsTheme.whiteColor),
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
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: colors),
                  ),
                  Text(
                    categorie,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: colors),
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
