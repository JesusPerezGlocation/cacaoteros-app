import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
ver imagen en grande desde la lista añadida
*/
class ViewImageVisitsScreen extends StatelessWidget {
  final Uint8List image;
  const ViewImageVisitsScreen({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          CircleAvatarSaveIconDraftComponent(
            icon: IconlyLight.delete,
            color: PaletteColorsTheme.principalColor,
            onTap: () => ShowModalPermissionGalleryWidget.showModalDeleteImage(
                context, image),
          )
        ],
      ),
      body: Center(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: InteractiveViewer(
              child: Image.memory(image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset(ImagesPaths.errorImage))),
        ),
      ),
    );
  }
}
