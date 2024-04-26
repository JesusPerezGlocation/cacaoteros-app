import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
titulo y acción, para menus  
*/
class ViewAllDraftComponents extends StatelessWidget {
  final String title;
  final String action;
  final int lenght;
  final Function onTap;
  const ViewAllDraftComponents({
    super.key,
    required this.title,
    required this.lenght,
    required this.action,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Spacer(),
        if (lenght >= 6)
          InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: PaletteColorsTheme.greyColor,
              onTap: () => onTap(),
              child: Text(
                action,
                textAlign: TextAlign.end,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium,
              ))
      ],
    );
  }
}
