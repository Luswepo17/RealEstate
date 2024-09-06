import 'package:flutter/material.dart';

class AppProductTitleText extends StatelessWidget {
  const AppProductTitleText(
      {super.key,
      required this.title,
      this.smallSize = false,
      this.maxLines = 1,
      this.textAlign});

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
