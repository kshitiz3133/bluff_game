import 'package:flutter/material.dart';
import 'features/play/gamescene.dart';

void main(){
  runApp(const Bluff());
}

class Bluff extends StatelessWidget {
  const Bluff({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GameScene(),
    );
  }
}
