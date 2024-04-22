import 'package:flutter/material.dart';

/*
titulo y acción, para menus  
*/
class ViewAllDraftComponents extends StatelessWidget {
  final String title;
  final String action;
  final Function onTap;
  const ViewAllDraftComponents({
    super.key,
    required this.title,
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
        TextButton(
            onPressed: () => onTap(),
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
