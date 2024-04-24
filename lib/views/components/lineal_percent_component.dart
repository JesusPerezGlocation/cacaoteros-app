import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
lineal horizontal para saber en que posición del a encuestas estas
*/
class LinealPercentComponent extends StatelessWidget {
  final double percent;
  final String? questions;
  final String answers;
  final Color colorOne;
  final Color colorTwo;
  const LinealPercentComponent({
    super.key,
    required this.percent,
    this.questions,
    required this.answers,
    required this.colorOne,
    required this.colorTwo,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LinearPercentIndicator(
          padding: EdgeInsets.zero,
          width: size.width * .4,
          lineHeight: size.height * .01,
          percent: percent,
          barRadius: const Radius.circular(10),
          backgroundColor: PaletteColorsTheme.greyColor,
          linearGradient: LinearGradient(colors: [
            colorOne,
            colorTwo
            // PaletteColorsTheme.principalColor,
            // Color.fromARGB(255, 132, 163, 54),
          ]),
        ),
        SizedBox(height: size.height * .002),
        RichText(
            maxLines: 1,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
                text: answers,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: PaletteColorsTheme.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 11),
                children: [
                  TextSpan(
                    text: ' de $questions pantallas',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: PaletteColorsTheme.blackColor,
                        fontWeight: FontWeight.w100,
                        fontSize: 11),
                  )
                ]))
      ],
    );
  }
}
