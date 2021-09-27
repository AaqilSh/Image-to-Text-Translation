import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SelectButton extends StatelessWidget {
  final String label;
  final Widget? page;
  const SelectButton({
    this.page,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page!));
      },
      child: Text(label),
      style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(Colors.deepPurple[900]),
          elevation: MaterialStateProperty.all(12.0)),
    );
  }
}
