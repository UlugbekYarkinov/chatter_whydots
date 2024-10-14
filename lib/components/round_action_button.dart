import 'package:flutter/material.dart';

class RoundActionButton extends StatelessWidget {
  const RoundActionButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  final void Function()? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Material(
        elevation: 5.0,
        color: Colors.lightBlueAccent,
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(label),
        ),
      ),
    );
  }
}
