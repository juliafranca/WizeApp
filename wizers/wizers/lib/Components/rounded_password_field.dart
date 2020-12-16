import 'package:flutter/material.dart';
import '../constants.dart';
import 'textfield_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
     TextEditingController controller, 
    FormFieldValidator<String> validator,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: TextStyle(color: wizeCinza),
        obscureText: !_showPassword,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "senha",
          hintStyle: TextStyle(color: wizeCinza),
          border: InputBorder.none,
          icon: Icon(Icons.lock, color: wizeCinza),
          suffixIcon: GestureDetector(
            onTap: () {
              _togglevisibility();
            },
            child: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
