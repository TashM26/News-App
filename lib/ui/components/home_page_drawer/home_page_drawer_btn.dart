import 'package:flutter/material.dart';

class HomePageDrawerBtn extends StatelessWidget {
  final String btnLangCode;
  final Function btnAction;
  const HomePageDrawerBtn({
    super.key,
    this.btnLangCode = 'ru',
    required this.btnAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => btnAction(),
      child: Text(
        btnLangCode.toUpperCase(),
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}