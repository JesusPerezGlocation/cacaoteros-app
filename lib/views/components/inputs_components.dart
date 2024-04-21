import 'package:flutter/material.dart';
import 'package:surveys_app/controllers/exports/exports.dart';

/*
manejo de los inputs utilizados en la app
 */
class InputsComponent extends StatelessWidget {
  final String title;
  final String hintext;
  final String? initialValue;
  final bool? enabled;
  final int? maxLine;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String? value) validator;
  final void Function(String value) onChanged;
  const InputsComponent({
    super.key,
    required this.title,
    required this.hintext,
    this.initialValue,
    this.enabled,
    this.maxLine,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    required this.validator,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      enabled: enabled,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: PaletteColorsTheme.principalColor,
          fontWeight: FontWeight.w500),
      maxLines: maxLine ?? 1,
      cursorColor: PaletteColorsTheme.principalColor,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: (value) => onChanged(value),
      validator: (value) => validator(value),
      textInputAction: textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
        hintText: hintext,
        labelText: title,
        // prefixIcon: Icon(iconData),
      ),
    );
  }
}

/*
input de tipo select 
*/

class DropdownComponents extends StatefulWidget {
  final String title;
  final String? hintext;
  final String? initialValue;
  final List<String> items;
  final void Function(Object? value) onChanged;
  final String? Function(String? value) validator;
  const DropdownComponents({
    super.key,
    required this.title,
    this.initialValue,
    this.hintext,
    required this.items,
    required this.validator,
    required this.onChanged,
  });

  @override
  State<DropdownComponents> createState() => _DropdownComponentsState();
}

class _DropdownComponentsState extends State<DropdownComponents> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      elevation: 3,
      validator: (value) => widget.validator(value),
      isExpanded: true,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: PaletteColorsTheme.principalColor,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        labelText: widget.title,
        hintText: widget.hintext ?? ' Seleccionar dato',
      ),
      items: widget.items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (value) {
        setState(() => widget.onChanged(value));
      },
    );
  }
}

/*
input desactivado
*/
class InputDesabledComponents extends StatelessWidget {
  final String title;
  final String hintext;
  final int? maxLine;
  final bool? enabled;
  final TextEditingController? controller;
  final String? Function(String? value) validator;
  final void Function(String value) onChanged;

  const InputDesabledComponents({
    super.key,
    required this.title,
    required this.hintext,
    this.maxLine,
    this.controller,
    required this.validator,
    required this.onChanged,
    this.enabled,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled ?? false,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: PaletteColorsTheme.principalColor,
          fontWeight: FontWeight.w500),
      maxLines: maxLine ?? 1,
      cursorColor: PaletteColorsTheme.principalColor,
      keyboardType: TextInputType.text,
      onChanged: (value) => onChanged(value),
      validator: (value) => validator(value),
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: hintext,
        labelText: title,
        // prefixIcon: Icon(iconData),
      ),
    );
  }
}

/*
inputs para fechas
*/
class InputsDatesComponent extends StatelessWidget {
  final String title;
  final String hintext;
  final String? initialValue;
  final bool? enabled;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String? value) validator;
  final void Function(String value) onChanged;
  const InputsDatesComponent({
    super.key,
    required this.title,
    required this.hintext,
    this.initialValue,
    this.maxLength,
    this.enabled,
    this.maxLine,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    required this.validator,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enabled,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: PaletteColorsTheme.principalColor,
          fontWeight: FontWeight.w500),
      maxLines: maxLine ?? 1,
      maxLength: maxLength ?? 2,
      cursorColor: PaletteColorsTheme.principalColor,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: (value) => onChanged(value),
      validator: (value) => validator(value),
      textInputAction: textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
        counter: const SizedBox(),
        hintText: hintext,
        labelText: title,
        // prefixIcon: Icon(iconData),
      ),
    );
  }
}

/*
inputs para números de telefonos
*/

class InputsPhoneComponent extends StatelessWidget {
  final String title;
  final String hintext;
  final String? initialValue;
  final bool? enabled;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? Function(String? value) validator;
  final void Function(String value) onChanged;
  const InputsPhoneComponent({
    super.key,
    required this.title,
    required this.hintext,
    this.initialValue,
    this.maxLength,
    this.enabled,
    this.maxLine,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    required this.validator,
    required this.onChanged,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: enabled,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: PaletteColorsTheme.principalColor,
          fontWeight: FontWeight.w500),
      maxLines: maxLine ?? 1,
      maxLength: maxLength ?? 2,
      cursorColor: PaletteColorsTheme.principalColor,
      keyboardType: keyboardType ?? TextInputType.text,
      onChanged: (value) => onChanged(value),
      validator: (value) => validator(value),
      textInputAction: textInputAction ?? TextInputAction.done,
      decoration: InputDecoration(
        counter: const SizedBox(),
        hintText: hintext,
        labelText: title,
        // prefixIcon: Icon(iconData),
      ),
    );
  }
}
