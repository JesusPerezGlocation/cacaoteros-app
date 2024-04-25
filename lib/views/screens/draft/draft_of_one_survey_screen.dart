import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
para ver la lista de borradores de una encuesta
*/
class DraftOfOneSurveysScreen extends StatelessWidget {
  final Color color;
  final String categorie;
  const DraftOfOneSurveysScreen({
    super.key,
    required this.color,
    required this.categorie,
  });
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
                title: categorie,
                color: color,
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
                          title: 'Title surveys data',
                          date: '20/05/2023 - 10:00 AM',
                          colors: color,
                          icons: IconlyLight.arrow_right_2,
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
