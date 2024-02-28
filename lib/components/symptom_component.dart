import 'package:flutter/material.dart';
import 'package:migraine_meter/pages/newEvent3.dart';


class SymptomComponent extends StatelessWidget {
  final String value;
  final String imagePath;
  final bool controller;
  final Function onChanged;

  const SymptomComponent({
    Key? key,
    required this.value,
    required this.imagePath,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              !controller ? Colors.purple.shade900 : Colors.red,
            ),
          ),
          onPressed: () {
            onChanged();
          },
          child: Image(
            height: 80,
            image: AssetImage(imagePath),
          ),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
