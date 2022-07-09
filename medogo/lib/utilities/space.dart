import 'package:flutter/material.dart';

class AddSpace extends StatelessWidget {

  final double verticalSpace;
  final double horizontalSpace;
  
  const AddSpace({Key? key,
  this.verticalSpace = 0.0,
  this.horizontalSpace = 0.0}): super(key: key);

  @override 
  Widget build(BuildContext context) {
      return SizedBox(
        height: verticalSpace,
        width: horizontalSpace
      );
  }

}