import 'package:flutter/material.dart';

class ButtonComponents extends StatelessWidget {
  final String title;
  final Function onPressed;
  const ButtonComponents({
    super.key,
    required this.title,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * .07,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}