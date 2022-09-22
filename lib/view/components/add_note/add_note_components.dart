import 'package:flutter/material.dart';

Widget addNoteField({
  required TextEditingController controller,
  required TextInputType type,
  required String text,
  int? lines,
}) =>
    TextFormField(
        controller: controller,
        keyboardType: type,
        maxLines: lines,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15),)
          ),
          label: Text(text, style: const TextStyle(color: Colors.black),),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.cyan), borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15),)),
          focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.red), borderRadius: BorderRadius.only(topLeft: Radius.circular(15), bottomRight: Radius.circular(15),)),
        )
    );

