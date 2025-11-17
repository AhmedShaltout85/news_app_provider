import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDownMenu extends StatelessWidget {
  final String selectedValue;
  final String value1;
  final String value2;
  final String title1;
  final String title2;
  void Function(String?)? onChanged;
  CustomDropDownMenu({
    super.key,
    required this.selectedValue,
    required this.value1,
    required this.value2,
    required this.title1,
    required this.title2,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButtonFormField<String>(
        style: TextStyle(color: Colors.white),
        dropdownColor: Colors.black,
        // initialValue: selectedValue,
        value: selectedValue,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        items: [
          DropdownMenuItem(value: value1, child: Text(title1)),
          DropdownMenuItem(value: value2, child: Text(title2)),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
