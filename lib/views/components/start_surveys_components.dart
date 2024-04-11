

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:iconly/iconly.dart';

/*
componente para iniciar las encuentes, en caso de ser varias encuestas retornaria este componente
*/
class StartSurveysComponents extends StatelessWidget {
final String title;
final String answers;
final double percent;
final String dateTime;
final Function onTap;
const StartSurveysComponents({super.key, 
required this.title, 
required this.answers, 
required this.percent, 
required this.dateTime, 
required this.onTap,
});
 @override
 Widget build(BuildContext context) {
final size = MediaQuery.of(context).size;
 return Container(
      height: size.height * .3,
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: PaletteColorsTheme.blackColor.withOpacity(0.1),
            offset: const Offset(0, 1),
            blurRadius: 20,
          )
        ],
        color: PaletteColorsTheme.whiteColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*imagen*/
              SizedBox(
                height: size.height * .13,
                width: size.width,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.asset(
                    ImagesPaths.surveyImg,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Image.asset(ImagesPaths.logo),
                  ),
                ),
              ),
              SizedBox(height: size.height * .015),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * .03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(height: size.height * .005),
                    Text(
                      dateTime, // Formatea el DateTime
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    SizedBox(height: size.height * .015),
                    LinearPercentIndicator(
                      padding: EdgeInsets.zero,
                      width: size.width *.75,
                      lineHeight: size.height * .015,
                      percent:percent,
                      barRadius: const Radius.circular(10),
                      backgroundColor: PaletteColorsTheme.greyColor,
                      linearGradient: const LinearGradient(colors: [
                        PaletteColorsTheme.principalColor,
                        Color.fromARGB(255, 132, 163, 54),
                      ]),
                    ),
                    SizedBox(height: size.height * .015),
                    Text(
                     answers,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              )
            ],
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width*.04,vertical: size.height*.01),
          child: InkWell(
            onTap: () =>onTap(),
            child: const  CircleAvatar(
              child: Icon(IconlyLight.arrow_right_2),
            ),
          ),
        ),  
        ],
      ),
    );
 }
}
 