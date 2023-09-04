import 'package:flutter/material.dart';

class NeoScaffold extends StatefulWidget {
  const NeoScaffold(
      {super.key,
      required this.body,
      this.floatingActionButton,
      this.drawer,
      this.appBar,
      this.floatingActionButtonLocation,
      this.resizeToAvoidBottomInset,
      this.padding,
      this.title,
      this.actions,
      this.decoration});
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

  @override
  State<NeoScaffold> createState() => _NeoScaffoldState();
}

class _NeoScaffoldState extends State<NeoScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: widget.floatingActionButton,
      appBar: widget.appBar,
      drawer: widget.drawer,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      body: Stack(
        children: [
          Container(
            padding: widget.padding,
            decoration: widget.decoration ??
                const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/png/bg.png'),
                      fit: BoxFit.cover),
                ),
          ),
          widget.body
        ],
      ),
    );
  }
}
