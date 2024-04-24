import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/models_exports.dart';

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
  static showModalReusableMunicipality(
    BuildContext context,
    TextEditingController departamentSelect,
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
          return _ContainerShowModalMunicipality(
            departamentSelect: departamentSelect,
            controllerSelectMunicipality: controllerSelectDepartment,
            controllerSelectCode: controllerSelectCode,
            onSelect: (val) => onSelect(val),
            onSetCode: (val) => onSetCode(val),
          );
        });
  }

  //4 show modal para seleccionar la vereda
  static showModalReusableVereda(
    BuildContext context,
    TextEditingController municipalitySelect,
    TextEditingController controllerSelectDepartment,
    TextEditingController controllerSelectCode,
    Function(String vereda) onSelect,
    Function(String veredaCode) onSetCode,
  ) {
    return showModalBottomSheet(
        backgroundColor: PaletteColorsTheme.transparentColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return _ContainerShowModalVereda(
            municipalitySelect: municipalitySelect,
            controllerSelectVereda: controllerSelectDepartment,
            controllerSelectCode: controllerSelectCode,
            onSelect: (val) => onSelect(val),
            onSetCode: (val) => onSetCode(val),
          );
        });
  }
}

/*seleccionar vereda*/
class _ContainerShowModalVereda extends StatefulWidget {
  final TextEditingController municipalitySelect;
  final TextEditingController controllerSelectVereda;
  final TextEditingController controllerSelectCode;
  final Function(String select) onSelect;
  final Function(String select) onSetCode;
  const _ContainerShowModalVereda({
    required this.municipalitySelect,
    required this.controllerSelectVereda,
    required this.controllerSelectCode,
    required this.onSelect,
    required this.onSetCode,
  });

  @override
  State<_ContainerShowModalVereda> createState() =>
      _ContainerShowModalVeredaState();
}

class _ContainerShowModalVeredaState extends State<_ContainerShowModalVereda> {
  int currentPage = 1;
  static const int pageSize = 10;
  bool hasNextPage = true;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    changeStatus();
  }

  changeStatus() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => isLoading = false);
    });
  }

  @override
  void dispose() {
    changeStatus();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.8,
        width: size.width,
        decoration: const BoxDecoration(
          color: PaletteColorsTheme.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            TitleAndCloseModal(
                title: 'VEREDAS > ${widget.municipalitySelect.text}'),
            if (FilterPlacesServices.getVeredasByMunicipio(
                    widget.municipalitySelect.text)
                .isEmpty)
              const IsEmptyDataComponent(title: 'No se encontraron veredas')
            else
              Expanded(
                child: FutureBuilder<List<MunicipalitiesModels>>(
                  future: fetchMunicipalities(widget.municipalitySelect.text),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingAppComponent();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final places = snapshot.data!;
                      return FadeIn(
                        child: ListView.separated(
                          itemCount: places.length,
                          separatorBuilder: (context, index) => const Divider(),
                          physics: const BouncingScrollPhysics(),
                          keyboardDismissBehavior:
                              ScrollViewKeyboardDismissBehavior.onDrag,
                          itemBuilder: (context, index) {
                            final data = places[index];
                            return ListTile(
                              onTap: () {
                                widget.controllerSelectVereda.text =
                                    data.vereda;

                                widget.onSelect(data.vereda);

                                /*codigo de la vereda*/
                                widget.controllerSelectCode.text = data.codMVer;
                                widget.onSetCode(data.codMVer);

                                Navigator.pop(context);
                              },
                              leading: const Icon(IconlyLight.location),
                              title: Text(
                                data.vereda,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              trailing: const Icon(IconlyLight.arrow_right_2),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            if (FilterPlacesServices.getVeredasByMunicipio(
                    widget.municipalitySelect.text)
                .isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: currentPage > 1 ? previousPage : null,
                    child: const Text('Anterior'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: hasNextPage ? nextPage : null,
                    child: const Text('Siguiente'),
                  ),
                ],
              ),
          ],
        ));
  }

  Future<List<MunicipalitiesModels>> fetchMunicipalities(
      String municipality) async {
    final places = FilterPlacesServices.getVeredasByMunicipio(
      municipality,
      page: currentPage,
      pageSize: pageSize,
    );

    hasNextPage = places.length == pageSize;

    return places;
  }

  void nextPage() {
    setState(() {
      currentPage++;
    });
  }

  void previousPage() {
    setState(() {
      currentPage--;
    });
  }
}

/*seleccionar municipios*/
class _ContainerShowModalMunicipality extends StatefulWidget {
  final TextEditingController departamentSelect;
  final TextEditingController controllerSelectMunicipality;
  final TextEditingController controllerSelectCode;
  final Function(String select) onSelect;
  final Function(String select) onSetCode;
  const _ContainerShowModalMunicipality({
    required this.controllerSelectMunicipality,
    required this.controllerSelectCode,
    required this.onSelect,
    required this.onSetCode,
    required this.departamentSelect,
  });

  @override
  State<_ContainerShowModalMunicipality> createState() =>
      _ContainerShowModalMunicipalityState();
}

class _ContainerShowModalMunicipalityState
    extends State<_ContainerShowModalMunicipality> {
  int _currentPage = 1;
  static const int _pageSize = 10; // Tamaño de la página
  bool _hasNextPage = true; // Indica si hay más páginas disponibles

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() => isLoading = false);
    });
  }

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
      child: Column(children: [
        TitleAndCloseModal(
            title: 'MUNICIPIO > ${widget.departamentSelect.text}'),
        if (FilterPlacesServices.getMunicipalitiesByDepartment(
                widget.departamentSelect.text)
            .isEmpty)
          const IsEmptyDataComponent(title: 'No se encontraron municipios')
        else
          Expanded(
            child: FutureBuilder<List<MunicipalitiesModels>>(
              future: _fetchMunicipalities(widget.departamentSelect.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingAppComponent();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final municipalities = snapshot.data!;
                  return FadeIn(
                    child: ListView.separated(
                      itemCount: municipalities.length,
                      separatorBuilder: (context, index) => const Divider(),
                      physics: const BouncingScrollPhysics(),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      itemBuilder: (context, index) {
                        final data = municipalities[index];

                        return ListTile(
                          onTap: () {
                            /*le paso el dato selccionado al controlador del departamento */
                            widget.controllerSelectMunicipality.text =
                                data.municipio;
                            /*seteo el dato */
                            widget.onSelect(data.municipio);

                            /*codigo del municipio*/
                            widget.controllerSelectCode.text = data.codMuni;
                            widget.onSetCode(data.codMuni);

                            /*cierro el pop up*/
                            Navigator.pop(context);
                          },
                          leading: const Icon(IconlyLight.location),
                          title: Text(
                            data.municipio,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          trailing: const Icon(IconlyLight.arrow_right_2),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        if (FilterPlacesServices.getMunicipalitiesByDepartment(
                widget.departamentSelect.text)
            .isNotEmpty)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _currentPage > 1 ? _previousPage : null,
                child: const Text('Anterior'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _hasNextPage ? _nextPage : null,
                child: const Text('Siguiente'),
              ),
            ],
          ),
      ]),
    );
  }

  Future<List<MunicipalitiesModels>> _fetchMunicipalities(String text) async {
    /*lama a la función para obtener municipios según el departamento y la página actual */
    final municipalities = FilterPlacesServices.getMunicipalitiesByDepartment(
        text,
        page: _currentPage,
        pageSize: _pageSize);

    /*verifica si hay más datos en la siguiente página */
    _hasNextPage = municipalities.length == _pageSize;

    return municipalities;
  }

  void _nextPage() {
    setState(() {
      _currentPage++;
    });
  }

  void _previousPage() {
    setState(() {
      _currentPage--;
    });
  }
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
