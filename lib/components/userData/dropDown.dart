import 'package:bejoy/design/colors/palette.dart';
import 'package:flutter/material.dart';

class dropdownMenu extends StatefulWidget {
  final Color? textColor;
  final double width;
  final String theme;
  final Color? dropdownColor;
  final String helper;
  String defaultValue;
  final List<String> list;
  final Function(String?)? onChanged;

  dropdownMenu(
      {super.key,
      required this.helper,
      required this.defaultValue,
      required this.list,
      this.onChanged,
      required this.theme,
      this.dropdownColor,
      required this.width,
      this.textColor});

  @override
  State<dropdownMenu> createState() => _dropdownMenuState();
}

class _dropdownMenuState extends State<dropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                color: deepTurquoise,
                width: 2,
              )),
          helper: Text(widget.helper),
          labelText: widget.theme,
          labelStyle: TextStyle(color: widget.textColor),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: lightTurquoise,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        value: widget.defaultValue.toString(),
        items: widget.list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: widget.onChanged,
        style: TextStyle(color: widget.textColor),
        dropdownColor: widget.dropdownColor,
      ),
    );
  }
}
