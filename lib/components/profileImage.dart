import 'package:flutter/material.dart';

class DynamicSliverAppBar extends StatefulWidget {
  DynamicSliverAppBar(
      {Key? key,
      required this.child,
      required this.maxHeight,
      required this.forceElevated,
      required this.implyLeading})
      : super(key: key);

  final Widget child;
  final double maxHeight;
  final forceElevated;
  final implyLeading;

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
      leading: widget.implyLeading ? InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back)) : null,
      pinned: true,
      elevation: 0,
      expandedHeight: isHeightCalculated ? height : widget.maxHeight,
      flexibleSpace: FlexibleSpaceBar(
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
