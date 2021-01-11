import 'package:flutter/material.dart';

class CloseModalBottomPageAndConfirmButtonWidget extends StatelessWidget {
  final Function onPressedCloseButton;
  final Function onPressedConfirmButton;
  CloseModalBottomPageAndConfirmButtonWidget({
    @required this.onPressedCloseButton,
    @required this.onPressedConfirmButton,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          //close button
          RawMaterialButton(
            onPressed: () {
              onPressedCloseButton();
            },
            elevation: 2.0,
            fillColor: Colors.amber[800],
            child: Icon(
              Icons.close,
              size: 30.0,
            ),
            //padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
          //confirm button button
          RawMaterialButton(
            onPressed: () {
              onPressedConfirmButton();
            },
            elevation: 2.0,
            fillColor: Colors.amber[800],
            child: Icon(
              Icons.add,
              size: 30.0,
            ),
            // padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
        ],
        //positioning the row to be in the middle of the container
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      width:double.infinity,
    );
  }
}
