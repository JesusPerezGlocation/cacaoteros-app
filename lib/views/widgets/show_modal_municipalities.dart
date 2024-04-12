import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';
import 'package:surveys_app/controllers/exports/models_exports.dart';

/*
clases para manejar los show modals en los municipios
*/
class ShowModalMunicipality {
  //#1
static showSelectDepartament(BuildContext context){
  return showModalBottomSheet(
    backgroundColor: PaletteColorsTheme.transparentColor,
    isScrollControlled: true,
    context: context, builder:(context) {
  return const _ContainerShowModalOne();
  });
}

//#2
static showSelectMunicipality(BuildContext context){
  return showModalBottomSheet(
    backgroundColor: PaletteColorsTheme.transparentColor,
    isScrollControlled: true,
    context: context, builder:(context) {
  return const _ContainerShowModalTwo();
  });
}
 
}

/*
container para el modal showSelectMunicipality
*/
class _ContainerShowModalOne extends StatefulWidget {

const _ContainerShowModalOne();

  @override
  State<_ContainerShowModalOne> createState() => _ContainerShowModalOneState();
}

class _ContainerShowModalOneState extends State<_ContainerShowModalOne> {

 
 @override
 Widget build(BuildContext context) {
final size = MediaQuery.of(context).size;
 final surveysPRV= Provider.of<SurveysQuestionsProvider>(context);
 return Container(
  height: size.height*.8,
  width: size.width,
  decoration:const BoxDecoration(
    color: PaletteColorsTheme.whiteColor,
    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
  ),
  child: Column(
    children: [
     const TitleAndCloseModal(title: 'DEPARTAMENTO'),
      
    if (JsonDataMunicipalities.departments.isEmpty) const IsEmptyDataComponent(title: 'No se encontraron municipios') else Expanded(
        child: FadeIn(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
           
          itemCount: JsonDataMunicipalities.departments.length,
            separatorBuilder:(context, index) => const Divider(), 
            itemBuilder:(context, index) {
              /*muestra el elemento en la lista */
               final item = JsonDataMunicipalities.departments[index];
              return ListTile(
                onTap: () {
                  /*le paso el dato selccionado al controlador del departamento */
                  surveysPRV.department.text =item;
                  /*seteo el dato */
                  surveysPRV.setDepartement(item);
          
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




/*
lista de municipios
*/
class _ContainerShowModalTwo extends StatefulWidget {
  const _ContainerShowModalTwo();

  @override
  _ContainerShowModalTwoState createState() => _ContainerShowModalTwoState();
}

class _ContainerShowModalTwoState extends State<_ContainerShowModalTwo> {
  int _currentPage = 1;
  static const int _pageSize = 10; // Tamaño de la página
  bool _hasNextPage = true; // Indica si hay más páginas disponibles

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final surveysPRV = Provider.of<SurveysQuestionsProvider>(context);
    return Container(
      height: size.height * 0.8,
      width: size.width,
      decoration: const BoxDecoration(
          color: PaletteColorsTheme.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20))),
      child: Column(
        children: [
          TitleAndCloseModal(
              title: 'MUNICIPIO > ${surveysPRV.department.text}'),

         JsonDataMunicipalities.getMunicipalitiesByDepartment(surveysPRV.department.text).isEmpty?

    const IsEmptyDataComponent(title: 'No se encontraron municipios'):
          Expanded(
            child: FutureBuilder<List<MunicipalitiesModels>>(
              future: _fetchMunicipalities(surveysPRV.department.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final municipalities = snapshot.data!;
                  return ListView.separated(
                    itemCount: municipalities.length,
                    separatorBuilder: (context, index) =>
                        const Divider(),
                    physics: const BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (context, index) {
                      final data = municipalities[index];
                      return ListTile(
                        onTap: () {
                  /*le paso el dato selccionado al controlador del departamento */
                  surveysPRV.municipality.text =data.municipio;
                  /*seteo el dato */
                  surveysPRV.setMunicipality(data.municipio);
          
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
                  );
                }
              },
            ),
          ),
        if(JsonDataMunicipalities.getMunicipalitiesByDepartment(surveysPRV.department.text).isNotEmpty) 
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
        ],
      ),
    );
  }

  Future<List<MunicipalitiesModels>> _fetchMunicipalities(String text) async {
    /*lama a la función para obtener municipios según el departamento y la página actual */
    final municipalities = await JsonDataMunicipalities.getMunicipalitiesByDepartment(
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

