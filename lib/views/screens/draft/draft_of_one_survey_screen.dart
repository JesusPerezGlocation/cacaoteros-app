import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
para ver la lista de borradores de una encuesta
*/
class DraftOfOneSurveysScreen extends StatefulWidget {
  final String categorie;
  final GetListDraftSurveysProvider getVisitsList;

  const DraftOfOneSurveysScreen({
    super.key,
    required this.categorie,
    required this.getVisitsList,
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
    getDataVisits();
    changeColorCard();
  }

  Future getDataVisits() async {
    await widget.getVisitsList.getListVisitsRegister();
    setState(() {});
  }

  /*cambia el color dependiendo de la categoria */
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
      appBar: AppBar(
        actions: [
          Consumer<NetworkStatus>(
            builder: (context, value, child) {
              /*si esta conectado a internet muestra el boton */
              if (value == NetworkStatus.online) {
                return UpLoadDataSurveysComponent(
                  color: changeColor,
                  onTap: () {
                    //Todo: debe enviar la lista de datos a firabase
                  },
                );
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
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
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: changeColor),
                maxLine: 3,
              ),
              SizedBox(height: size.height * .02),
              FutureBuilder<List<VisitsSurveysModels>>(
                future: VisitsRegisterSQLServices.instance.readVisitsRegister(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingAppComponent(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: IsEmptyDataComponent(
                        title:
                            'Error al obtener la lista: ${snapshot.hasError}',
                      ),
                    );
                  } else {
                    List<VisitsSurveysModels> visits = snapshot.data!;
                    if (visits.isEmpty) {
                      return Center(
                        child: IsEmptyWithImageComponents(
                          image: ImagesPaths.emptyDraft,
                          title: 'No se hallaron resultados de borradores.',
                        ),
                      );
                    } else {
                      return Expanded(
                              child: ListView.separated(
                                  itemCount: visits.length,
                                  physics: const BouncingScrollPhysics(),
                                  keyboardDismissBehavior:
                                      ScrollViewKeyboardDismissBehavior.onDrag,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: size.height * .01),
                                  itemBuilder: (context, index) {
                                    final date = visits[index];

                                    return CardDraftOneSurveyComponents(
                                      id: date.metainstanceID,
                                      title: date.submitterName,
                                      date: date.start,
                                      icons: IconlyLight.arrow_right_2,
                                      color: changeColor,
                                      percent: date.percent,
                                    );
                                  }))
                          .animate(delay: const Duration(milliseconds: 50))
                          .fadeIn(delay: const Duration(milliseconds: 10))

                          // .animate(onPlay: (controller) => controller.reverse())
                          .shimmer(duration: 1400.ms);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
