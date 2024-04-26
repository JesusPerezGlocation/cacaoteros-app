import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
card para retornar en la lista de borradores de una encuesta
*/
class CardDraftOneSurveyComponents extends StatefulWidget {
  final String id;
  final String title;
  final String date;
  final Color color;
  final IconData icons;
  final double percent;

  const CardDraftOneSurveyComponents({
    super.key,
    required this.title,
    required this.date,
    required this.color,
    required this.icons,
    required this.percent,
    required this.id,
  });

  @override
  State<CardDraftOneSurveyComponents> createState() =>
      _CardDraftOneSurveyComponentsState();
}

class _CardDraftOneSurveyComponentsState
    extends State<CardDraftOneSurveyComponents> with TickerProviderStateMixin {
  SlidableController? slidableController;
  @override
  void initState() {
    super.initState();
    slidableController = SlidableController(this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // borderRadius: BorderRadius.circular(15),
    // splashColor: color.withOpacity(0.4),
    // onTap: () => onTap(),
    return Slidable(
      controller: slidableController,
      key: ValueKey(widget.id),
      startActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          /*boton para editar la encuesta*/
          ButtonSliderComponents(
            color: widget.color,
            iconData: IconlyLight.edit,
            onTap: () {
              //Todo: debe pasar el dia y navegar a editar la encuest
            },
          )
        ],
      ),
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          const Spacer(),
          /*boton para eliminar la encuesta de la lista de encuentas guardas*/
          ButtonSliderComponents(
            color: PaletteColorsTheme.redErrorColor,
            iconData: IconlyLight.delete,
            onTap: () {
              //Todo debe prguntar si quiere eliminar la encuesta
            },
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        splashColor: widget.color.withOpacity(0.4),
        onTap: () {
          slidableController!.openStartActionPane();
        },
        onDoubleTap: () {
          slidableController!.openEndActionPane();
        },
        child: Container(
          height: size.height * .1,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: size.width * .02),
          decoration: BoxDecoration(
            color: widget.color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*porcentaje completado*/
              SizedBox(
                child: CircularPercentIndicator(
                  radius: 25,
                  percent: widget.percent,
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 6.0,
                  center: Text(
                    '${widget.percent}%',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  backgroundColor: widget.color.withOpacity(0.2),
                  linearGradient: LinearGradient(colors: [
                    widget.color,
                    widget.color.withOpacity(0.4),
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
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: PaletteColorsTheme.blackColor),
                    ),
                    Text(
                      widget.date,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: PaletteColorsTheme.greyColorTwo),
                    )
                  ],
                ),
              ),
              Icon(
                widget.icons,
                color: widget.color,
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
card para retornar en la lista de borradores
*/
class CardDraftComponents extends StatefulWidget {
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
  State<CardDraftComponents> createState() => _CardDraftComponentsState();
}

class _CardDraftComponentsState extends State<CardDraftComponents> {
  Color changeColor = PaletteColorsTheme.principalColor;

  @override
  void initState() {
    super.initState();
    changeColorCard();
  }

  changeColorCard() {
    switch (widget.categorie) {
      case NameSurveys.beneficiaries:
        changeColor = PaletteColorsTheme.secondaryColor;
        break;
      case NameSurveys.visits:
        changeColor = PaletteColorsTheme.principalColor;
        break;
      case NameSurveys.taskAdminist:
        changeColor = PaletteColorsTheme.principalColor;
        break;
      case NameSurveys.caracterization:
        changeColor = PaletteColorsTheme.secondaryColor;
        break;
      case NameSurveys.collectionCenter:
        changeColor = PaletteColorsTheme.secondaryColor;
        break;
      case NameSurveys.kardex:
        changeColor = PaletteColorsTheme.secondaryColor;
        break;
      case NameSurveys.registerCocoa:
        changeColor = PaletteColorsTheme.secondaryColor;
        break;
      default:
        changeColor = PaletteColorsTheme.principalColor;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: changeColor.withOpacity(0.4),
      onTap: () => widget.onTap(),
      child: Container(
        height: size.height * .1,
        width: size.width,
        decoration: BoxDecoration(
          color: changeColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            /*fecha */
            Container(
              height: size.height,
              width: size.width * .13,
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * .011, vertical: size.height * .002),
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * .02, vertical: size.height * .017),
              decoration: BoxDecoration(
                  color: changeColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                widget.date.substring(0, 10),
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
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: PaletteColorsTheme.blackColor),
                  ),
                  Text(widget.categorie,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: PaletteColorsTheme.greyColorTwo))
                ],
              ),
            ),
            Icon(widget.icons, color: changeColor)
          ],
        ),
      ),
    );
  }
}
