import 'package:flutter/material.dart';

class AmberTextInput extends StatelessWidget {
  final String labelText;

  /// {@macro flutter.widgets.editableText.onChanged}
  ///
  /// See also:
  ///
  ///  * [inputFormatters], which are called before [onChanged]
  ///    runs and can validate and change ("format") the input value.
  ///  * [onEditingComplete], [onSubmitted]:
  ///    which are more specialized input change notifications.
  final void Function(String) onChanged;
  final double leftPaddingValue;
  final double textInputWidth;
  final double textInputHeight;
  AmberTextInput({
    @required this.labelText,
    @required this.onChanged,
    @required this.leftPaddingValue,
    this.textInputWidth = 250,
    this.textInputHeight,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          labelText: this.labelText,
          //border properties
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber[800]),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber[800]),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.amber[800]),
          ),
        ),
        autocorrect: false,
        onChanged: (stringValue) {
          onChanged(stringValue);
        },
        controller: TextEditingController(text: "Initial Text here")
      ),
      width: this.textInputWidth,
      height: textInputHeight,
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(
        left: this.leftPaddingValue,
      ),
    );
  }
}
