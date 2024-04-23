import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:iconly/iconly.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
show modal para el usuario no tiene permisos de galeria
*/
class ShowModalPermissionGalleryWidget {
  /*modal cuando el usuario no tiene permisos*/
  static showNoPermission(BuildContext context) {
    return showModalBottomSheet(
        isDismissible: false,
        backgroundColor: PaletteColorsTheme.transparentColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const _ContainerShowModal();
        });
  }

  static showModalSelectImage(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: PaletteColorsTheme.transparentColor,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const _ContainerShowModalTwo();
        });
  }
}

class _ContainerShowModalTwo extends StatelessWidget {
  const _ContainerShowModalTwo();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final visitsPrv = Provider.of<VisitsSurveysProvider>(context);
    return Container(
      height: size.height * .3,
      width: size.width,
      decoration: const BoxDecoration(
          color: PaletteColorsTheme.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        children: [
          const TitleAndCloseModal(title: 'Seleccionar acción'),
          SizedBox(height: size.height * .01),
          ListTile(
            onTap: () async {
              /*cierra el modal */
              Navigator.pop(context);
              /*abre la camara */
              await visitsPrv.dataPickerImage();
            },
            leading: const Icon(IconlyLight.camera, size: 30),
            title: Text(
              'Tomar fotografía',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            trailing: const Icon(IconlyLight.arrow_right_2),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(IconlyLight.camera, size: 30),
            title: Text(
              'Seleccionar imagen',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            trailing: const Icon(IconlyLight.arrow_right_2),
          ),
        ],
      ),
    );
  }
}

class _ContainerShowModal extends StatelessWidget {
  const _ContainerShowModal();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .5,
      width: size.width,
      decoration: const BoxDecoration(
          color: PaletteColorsTheme.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        children: [
          SizedBox(
              height: size.height * .2,
              child: Image.asset(ImagesPaths.permissionGallery)),
          Text(
            'Permiso de galería requerido',
            style: Theme.of(context).textTheme.headlineMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(
            'Lo sentimos, parece que no se han otorgado los permisos necesarios para acceder a la galería de imágenes. Para continuar, por favor, otorgue los permisos de galería manualmente desde la configuración de su dispositivo.',
            style: Theme.of(context).textTheme.bodyMedium,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * .05),
          ButtonComponents(
            colorButton: PaletteColorsTheme.principalColor,
            title: 'Ir a configuración',
            onPressed: () {
              Navigator.pop(context);
              /*abre los seeting */
              openAppSettings();
            },
          ),
        ],
      ).animate().fade().scale(),
    );
  }
}
