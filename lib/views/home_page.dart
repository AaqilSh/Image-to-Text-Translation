import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/select_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SelectButton(),
            MaterialButton(onPressed: () {}, child: const Text('From image'))
          ],
        ),
      ),
    );
  }
}
