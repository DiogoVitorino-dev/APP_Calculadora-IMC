import 'package:flutter/material.dart';

class HeaderListButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onPressed;

  const HeaderListButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)))),
        onPressed: () => onPressed(),
        icon: Icon(icon, size: 25),
        label: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ));
  }
}
