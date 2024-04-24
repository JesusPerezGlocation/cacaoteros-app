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
                            leading: const Icon(IconlyLight.location),
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

  //#2 seleccionar departamento reutilizable
  static showModalReusableDepartments(
    BuildContext context,
    TextEditingController controllerSelectDepartment,
    TextEditingController controllerSelectCode,
    Function(String department) onSelect,
    Function(String code) onSetCode,
  ) {
    return showModalBottomSheet(
        backgroundColor: PaletteColorsTheme.transparentColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return _ContainerShowModalDepartments(
            controllerSelectDepartment: controllerSelectDepartment,
            controllerSelectCode: controllerSelectCode,
            onSelect: (val) => onSelect(val),
            onSetCode: (val) => onSetCode(val),
          );
        });
  }
  //3 show modal para seleccionar el municipio
}

/*selecciona el departmento*/
class _ContainerShowModalDepartments extends StatelessWidget {
  final TextEditingController controllerSelectDepartment;
  final TextEditingController controllerSelectCode;
  final Function(String select) onSelect;
  final Function(String select) onSetCode;
  const _ContainerShowModalDepartments({
    required this.controllerSelectDepartment,
    required this.onSelect,
    required this.onSetCode,
    required this.controllerSelectCode,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .8,
      width: size.width,
      decoration: const BoxDecoration(
          color: PaletteColorsTheme.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          const TitleAndCloseModal(title: 'DEPARTAMENTO'),
          if (FilterPlacesServices.departments.isEmpty)
            const IsEmptyDataComponent(title: 'No se encontraron municipios')
          else
            Expanded(
              child: FadeIn(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: FilterPlacesServices.departments.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    /*muestra el elemento en la lista */
                    final item = FilterPlacesServices.departments[index];
                    final codeDepart =
                        FilterPlacesServices.codeDepartaments[index];
                    return ListTile(
                      onTap: () {
                        /*le paso el dato selccionado al controlador del departamento */
                        controllerSelectDepartment.text = item;
                        /*seteo el dato */
                        onSelect(item);
                        /*codigo del departamento */
                        controllerSelectCode.text = codeDepart;
                        onSetCode(codeDepart);

                        /*cierro el pop up*/
                        Navigator.pop(context);
                      },
                      leading: const Icon(IconlyLight.location),
                      title: Text(
                        item,
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
  }
}
