import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
show modal para seleccionar datos en las encuestas
*/
//!!cambiar los inputs por este dato
class ShowModalSelectWidget {
  static showModalSelect(BuildContext context, List<String> items, String title,
      TextEditingController controller, Function(String select) onSelect) {
    return showModalBottomSheet(
        backgroundColor: PaletteColorsTheme.transparentColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          final size = MediaQuery.of(context).size;
          return Container(
            height: size.height * .8,
            width: size.width,
            decoration: const BoxDecoration(
                color: PaletteColorsTheme.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                TitleAndCloseModal(title: title),
                if (FilterPlacesServices.departments.isEmpty)
                  const IsEmptyDataComponent(title: 'No se encontraron datos')
                else
                  Expanded(
                    child: FadeIn(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        itemCount: items.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          /*muestra el elemento en la lista */

                          return ListTile(
                            onTap: () {
                              /*le paso el dato selccionado al controlador*/
                              controller.text = items[index];
                              /*seteo el dato */
                              onSelect(items[index]);

                              /*cierro el pop up*/
                              Navigator.pop(context);
                            },
                            leading: const Icon(IconlyLight.plus),
                            title: Text(
                              items[index],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            trailing: const Icon(IconlyLight.arrow_right_2),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          );
        });
  }
}
