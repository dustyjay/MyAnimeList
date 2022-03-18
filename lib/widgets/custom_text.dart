import 'package:flutter/material.dart';

Widget setText(BuildContext context, String text,
    {TextAlign textAlign = TextAlign.start}) {
  return Flexible(
      child: Text(
    text,
    textAlign: textAlign,
  ));
}
