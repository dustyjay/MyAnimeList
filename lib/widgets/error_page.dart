import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  final String? buttonText;
  final VoidCallback? onClick;
  const ErrorPage(this.message, {Key? key, this.buttonText, this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Column(
            children: [
              const Icon(
                Icons.accessibility,
                size: 48.0,
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  message,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          )))
    ]);
  }
}
