import 'package:anime_list/widgets/error_page.dart';
import 'package:flutter/material.dart';

class PageLayout extends StatefulWidget {
  final bool loading;
  final Widget mainWidget;
  final bool hasError;
  const PageLayout(
      {Key? key,
      required this.loading,
      required this.hasError,
      required this.mainWidget})
      : super(key: key);

  @override
  State<PageLayout> createState() => _PageLoadingState();
}

class _PageLoadingState extends State<PageLayout> {
  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return Align(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(146, 236, 236, 236)),
              width: 70.0,
              height: 70.0,
              child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Center(
                      child: CircularProgressIndicator(color: Colors.red)))));
    } else if (widget.hasError) {
      return const ErrorPage('This is an error message');
    }
    return widget.mainWidget;
  }
}
