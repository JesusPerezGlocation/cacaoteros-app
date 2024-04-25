import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
lista de borradores sin enviar
*/
class ListViewHomeDraftWidget extends StatefulWidget {
  final GetListDraftSurveysProvider getSurveys;
  const ListViewHomeDraftWidget({
    super.key,
    required this.getSurveys,
  });

  @override
  State<ListViewHomeDraftWidget> createState() =>
      _ListViewHomeDraftWidgetState();
}

class _ListViewHomeDraftWidgetState extends State<ListViewHomeDraftWidget> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
    widget.getSurveys.getSetListSurveys();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.separated(
      itemCount: widget.getSurveys.listsSurveysDraft.length,
      physics: const BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      separatorBuilder: (context, index) => SizedBox(height: size.height * .01),
      itemBuilder: (context, index) {
        final data = widget.getSurveys.listsSurveysDraft[index];
        /*retorna la lista de items */
        return FadeIn(
          child: CardDraftComponents(
            id: data.id.toString(),
            title: data.title,
            date: data.date,
            categorie: data.categorie,
            icons: IconlyLight.arrow_right_2,
            onTap: () {
              /*navega a la pantalla de la lista de una encuesta */
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DraftOfOneSurveysScreen(
                          color: PaletteColorsTheme.principalColor,
                          categorie: data.categorie,
                        )),
              );
            },
          ),
        );
      },
    );
  }
}
