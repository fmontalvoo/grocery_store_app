import 'package:flutter/material.dart';

class StaggeredDualView extends StatelessWidget {
  const StaggeredDualView({
    Key key,
    @required this.itemBuilder,
    @required this.itemCount,
    this.spacing = 0.0,
    this.offsetPercent = 0.5,
    this.aspectRatio = 0.5,
  }) : super(key: key);
  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final double spacing;
  final double offsetPercent;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final itemHeight = (width * 0.5) / aspectRatio;
        final height = constraints.maxHeight + itemHeight;
        return OverflowBox(
          minWidth: width,
          maxWidth: width,
          minHeight: height,
          maxHeight: height,
          child: GridView.builder(
            padding: EdgeInsets.only(top: itemHeight * .5, bottom: itemHeight),
            itemCount: itemCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: spacing,
              crossAxisSpacing: spacing,
              childAspectRatio: aspectRatio,
            ),
            itemBuilder: (context, index) => Transform.translate(
              offset:
                  Offset(0.0, index.isOdd ? itemHeight * offsetPercent : 0.0),
              child: itemBuilder(context, index),
            ),
          ),
        );
      },
    );
  }
}
