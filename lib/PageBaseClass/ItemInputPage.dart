import 'package:flutter/material.dart';

class ItemInputPageWidget extends StatefulWidget {
  final String inputPageTitle;
  //not including spacing, needs to create spacing directly
  final List<Widget> inputWidgetListImplementation;
  @override
  _ItemInputPageWidgetState createState() => _ItemInputPageWidgetState();
  ItemInputPageWidget({
    @required this.inputPageTitle,
    @required this.inputWidgetListImplementation,
  });
}

class _ItemInputPageWidgetState extends State<ItemInputPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        child: SingleChildScrollView(
          //widgets for this page(containing search field,boxed container and ect)
          child: Column(
            children: widget.inputWidgetListImplementation,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
        alignment: Alignment.topLeft,
      ),
    );
  }
}
