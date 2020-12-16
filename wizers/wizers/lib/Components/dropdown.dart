import 'package:flutter/material.dart';
import 'package:wizers/Components/textfield_container.dart';

import '../constants.dart';

class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String dropdownValue = 'Escolha';

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: DropdownButton<String>(
      value: dropdownValue,
      dropdownColor: wizeRoxo,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: wizeCinza),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Escolha', 'Artes', 'Educação', 'Moda', 'Prestação de serviços', 'Alimentação', 'Saúde',  'Beleza', 'Outros']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ));
  }
}
