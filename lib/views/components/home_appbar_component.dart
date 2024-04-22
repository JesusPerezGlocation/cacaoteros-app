import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

class HomeAppBarComponents extends StatefulWidget {
  final NetworkStatus ethernetProvider;
  final NoConnectionEthernetProvider statusPrv;
  const HomeAppBarComponents({
    super.key,
    required this.ethernetProvider,
    required this.statusPrv,
  });

  @override
  State<HomeAppBarComponents> createState() => _HomeAppBarComponentsState();
}

class _HomeAppBarComponentsState extends State<HomeAppBarComponents> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      widget.statusPrv.getCheckConnection(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.statusPrv.getCheckConnection(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (widget.ethernetProvider == NetworkStatus.online) {
      return Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(ImagesPaths.logo),
          ),
          SizedBox(width: size.width * .02),
          const Text(
            'Bienvenido',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ],
      );
    } else {
      return Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(ImagesPaths.logo),
          ),
          SizedBox(width: size.width * .02),
          const Text(
            'Sin conexión a internet',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          SizedBox(width: size.width * .02),
          LoadingAnimationWidget.fourRotatingDots(
              color: PaletteColorsTheme.principalColor, size: 25)
          // const Icon(Icons.wifi_off_rounded,
          //     color: PaletteColorsTheme.redErrorColor)
        ],
      );
    }
  }
}
