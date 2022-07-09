import 'package:flutter/material.dart';
import 'package:medogo/utilities/space.dart';


class SliverSpaceVertical extends StatefulWidget {
  final double verticalSpace;
  const SliverSpaceVertical({Key? key,
  required this.verticalSpace}): super(key: key);
  @override 
  _SliverSpaceVerticalState createState() => _SliverSpaceVerticalState();
}

class _SliverSpaceVerticalState extends State<SliverSpaceVertical> {
  @override 
  Widget build(BuildContext context) {
    return  SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: widget.verticalSpace,
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: 6.0),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return const AddSpace(verticalSpace: 5.0);
            },
            childCount: 1));       
  }
}