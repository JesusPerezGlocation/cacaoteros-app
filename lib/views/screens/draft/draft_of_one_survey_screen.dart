import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
para ver la lista de borradores de una encuesta
*/
class DraftOfOneSurveysScreen extends StatefulWidget {
  final String categorie;
  const DraftOfOneSurveysScreen({
    super.key,
    required this.categorie,
  });

  @override
  State<DraftOfOneSurveysScreen> createState() =>
      _DraftOfOneSurveysScreenState();
}

class _DraftOfOneSurveysScreenState extends State<DraftOfOneSurveysScreen> {
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
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .03, vertical: size.height * .03),
        child: FadeIn(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleSurveysComponents(
                title: widget.categorie,
                color: changeColor,
              ),
              SizedBox(height: size.height * .02),
              Expanded(
                  child: ListView.separated(
                      itemCount: 3,
                      physics: const BouncingScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: size.height * .01),
                      itemBuilder: (context, index) {
                        return CardDraftOneSurveyComponents(
                          id: '2312132',
                          title: 'Title surveys data',
                          date: '20/05/2023 - 10:00 AM',
                          icons: IconlyLight.arrow_right_2,
                          color: changeColor,
                          percent: .2,
                          onTap: () {},
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
