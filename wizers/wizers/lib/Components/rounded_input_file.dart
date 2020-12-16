import 'package:flutter/material.dart';

import '../constants.dart';
import 'textfield_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
 
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    TextEditingController controller, 
    FormFieldValidator<String> validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: TextStyle(color: wizeCinza),
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: wizeCinza,
            ),
            hintText: hintText,
            
            border: InputBorder.none,
            hintStyle: TextStyle(color: wizeCinza)),
            
      ),
    );
  }
}
