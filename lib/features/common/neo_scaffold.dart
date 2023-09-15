import 'package:flutter/material.dart';

class NeoScaffold extends StatefulWidget {
  const NeoScaffold({
    super.key,
    required this.body,
    this.floatingActionButton,
    this.drawer,
    this.appBar,
    this.floatingActionButtonLocation,
    this.resizeToAvoidBottomInset,
    this.padding,
    this.title,
    this.actions,
    this.decoration,
    this.bottomNavigationBar,
    this.extendBodyBehindAppBar,
  });
  final bool? extendBodyBehindAppBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Drawer? drawer;
  final PreferredSize? appBar;
  final EdgeInsetsGeometry? padding;
  final Text? title;
  final Text? actions;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? resizeToAvoidBottomInset;
  final Decoration? decoration;
  final Widget? bottomNavigationBar;

  @override
  State<NeoScaffold> createState() => _NeoScaffoldState();
}

class _NeoScaffoldState extends State<NeoScaffold> {
  Size? size;
  double? width;
  double? height;
  int count = 5000;

  void initSize(BuildContext context) {
    if (size == null) {
      size = MediaQuery.of(context).size;
      width = size!.width / 32;
      height = size!.height / 80;
      if (size!.height > 1000) {
        count = 8000;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    initSize(context);
    return Scaffold(
      backgroundColor: Colors.black,

      extendBodyBehindAppBar: widget.extendBodyBehindAppBar ?? false,
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: widget.appBar,
      drawer: widget.drawer,

      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(124, 213, 162, 0.14),
              Color.fromRGBO(121, 214, 152, 0),
            ],
          ),
        ),
        child: Stack(
          children: [
            Wrap(
              children: List.generate(
                count,
                (index) => Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(124, 213, 162, 0.02),
                      width: 0.1,
                    ),
                  ),
                ),
              ),
            ),
            widget.body,
          ],
        ),
      ),
      // body: Container(
      //   width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      //   padding: widget.padding,
      //   decoration: widget.decoration ??
      //       const BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage('assets/png/bg.png'),
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //   child: widget.body,
      // ),
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}
