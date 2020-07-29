import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int isSelected = 0;
  List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              setState(() {
                isSelected = index;
              });
            },

            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30,),
              child: Text(categories[index],
              style: TextStyle(
                color: index == isSelected ? Colors.white : Colors.white60,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                fontSize: 24.0
              ),
              ),
            ),
          );
        },
      ),
    );
  }
}
