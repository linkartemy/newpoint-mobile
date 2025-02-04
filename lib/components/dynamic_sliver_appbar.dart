import 'package:flutter/material.dart';

class DynamicSliverAppBar extends StatefulWidget {
  DynamicSliverAppBar(
      {Key? key,
      required this.child,
      required this.maxHeight,
      required this.forceElevated,
      required this.implyLeading,
      this.collapseMode})
      : super(key: key);

  final Widget child;
  final double maxHeight;
  final forceElevated;
  final implyLeading;
  final CollapseMode? collapseMode;

  @override
  _DynamicSliverAppBarState createState() => _DynamicSliverAppBarState();
}

class _DynamicSliverAppBarState extends State<DynamicSliverAppBar> {
  final GlobalKey _childKey = GlobalKey();
  bool isHeightCalculated = false;
  late double height;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!isHeightCalculated) {
        isHeightCalculated = true;
        setState(() {
          height = (_childKey.currentContext?.findRenderObject() as RenderBox)
              .size
              .height;
        });
      }
    });

    return SliverAppBar(
      forceElevated: widget.forceElevated,
      automaticallyImplyLeading: widget.implyLeading,
      leading: widget.implyLeading
          ? InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.arrow_back))
          : null,
      pinned: false,
      elevation: 0,
      expandedHeight: isHeightCalculated ? height : widget.maxHeight,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: widget.collapseMode ?? CollapseMode.parallax,
        background: Column(
          children: [
            Container(
              key: _childKey,
              child: widget.child,
            ),
            const Expanded(child: SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
