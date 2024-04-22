import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/screens_exports.dart';

/*
pantalla número 4 para encuestas las visitas
*/
class FourSurveysVisitsScreen extends StatelessWidget {
  const FourSurveysVisitsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: const _BottonNavigatorMapComponents(),
      appBar: AppBar(actions: [
        SaveIconDraftComponents(
          color: PaletteColorsTheme.principalColor,
          onTap: () {},
        )
      ]),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: PaletteColorsTheme.greyColor,
          ),
        ],
      ),
      // body: FadeIn(child: FlutterMap(options: MapOptions(), children: [])),
    );
  }
}

/*
componente para el boton del mapa y que navegue a la sig pantalla 
*/
class _BottonNavigatorMapComponents extends StatelessWidget {
  const _BottonNavigatorMapComponents({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .22,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * .03),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: PaletteColorsTheme.blackColor.withOpacity(0.1),
                offset: const Offset(0, -10),
                blurRadius: 20)
          ],
          color: PaletteColorsTheme.whiteColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: size.height * .06,
              width: size.width * .15,
              decoration: BoxDecoration(
                  color: PaletteColorsTheme.principalColor,
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                  child: Icon(
                IconlyLight.location,
                color: PaletteColorsTheme.whiteColor,
                size: 30,
              )),
            ),
            title: Text(
              'Ubicación marcada',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            subtitle: Text(
              '39983983984-49329832908308, 291902',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          SizedBox(height: size.height * .02),
          ButtonComponents(
            title: 'Continuar',
            colorButton: PaletteColorsTheme.principalColor,
            onPressed: () {
              /*navega a la pantalla #5 */
              Navigator.pushNamed(
                context,
                MainRoutes.fiveVisitsSurveysRoute,
              );
            },
          ),
        ],
      ),
    );
  }
}
