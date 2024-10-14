import 'package:flutter/material.dart';

InputDecoration getTextFieldInputDecoration(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.black38),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(32.0),
      ),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}