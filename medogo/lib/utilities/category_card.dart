import 'package:flutter/material.dart';
import 'package:medogo/constants.dart';
class CategoryCard extends StatefulWidget {
  final String image;
  final String categoryName;
  final String route;
  const CategoryCard({Key? key,
  required this.image, 
  required this.categoryName,
  required this.route}): super(key: key);
  @override 
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override 
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, widget.route);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
          Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            height: 200.0,
            width: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/${widget.image}")),
              shape: BoxShape.circle)),
              Text(widget.categoryName, style: 
              const TextStyle(
                color: kPrimaryColor, 
                fontSize: 20.0))]));
  }
}