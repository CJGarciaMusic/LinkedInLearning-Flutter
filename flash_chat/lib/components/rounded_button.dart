import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.color,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final Color color;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Material(
            elevation: 5,
            color: color,
            borderRadius: BorderRadius.circular(30),
            child: MaterialButton(
              onPressed: onPressed,
              minWidth: 200,
              height: 42,
              child: Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
            )
        )
    );
  }
}