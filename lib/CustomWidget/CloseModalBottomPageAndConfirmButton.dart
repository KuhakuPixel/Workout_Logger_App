import 'package:flutter/material.dart';

class CloseAndConfirmButtonWidget extends StatelessWidget {
  final Function onPressedCloseButton;
  final Function onPressedConfirmButton;

  ///the icon for the button
  final IconData leftButtonIcon;

  ///the icon for the button
  final IconData rightButtonIcon;
  CloseAndConfirmButtonWidget({
    @required this.onPressedCloseButton,
    @required this.onPressedConfirmButton,
    this.leftButtonIcon = Icons.close,
    this.rightButtonIcon = Icons.add,
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
              this.leftButtonIcon,
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
              this.rightButtonIcon,
              size: 30.0,
            ),
            // padding: EdgeInsets.all(15.0),
            shape: CircleBorder(),
          ),
        ],
        //positioning the row to be in the middle of the container
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      width: double.infinity,
    );
  }
}
