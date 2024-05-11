import 'dart:async';

import 'package:bluff_game/features/play/play_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameScene extends StatefulWidget {
  const GameScene({Key? key}) : super(key: key);

  @override
  State<GameScene> createState() => _GameSceneState();
}

class _GameSceneState extends State<GameScene> {
  final PlayBloc playBloc = PlayBloc();

  @override
  void initState() {
    playBloc.add(PlayInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlayBloc, PlayState>(
      bloc: playBloc,
      listenWhen: (previous,current)=>current is PlayActionState,
      buildWhen: (previous,current)=>current is PlayState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        switch (state.runtimeType){
          case PlayLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          case PlayLoadedSuccessState:
            return Scaffold(
              body: Stack(
                children: [
                  MyStack(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            playBloc.add(PlayBluffButtonEvent());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('BLUFF'),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}

Widget MyStack() {
  return Stack(
    children: [
      ...List.generate(
        10, // Generate 3 instances
            (index) => MyCard(a: -index.toDouble() / 6 + 0.75),
      ),
    ],
  );
}

class MyCard extends StatefulWidget {
  const MyCard({Key? key, required this.a}) : super(key: key);

  final double a;

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  double y = 0.8;

  @override
  Widget build(BuildContext context) {
    double x = widget.a;
    void check() {
      setState(() {
        x = 0;
        y = 0;
      });
    }

    return AnimatedAlign(
        duration: Duration(milliseconds: 200),
        alignment: Alignment(x, y),
        child: GestureDetector(
            onTap: () {
              setState(() {
                if (y < 0.8) {
                  y = 0.8;
                } else {
                  y = y - 0.25;
                }
                print(y);
              });
            },
            child: Container(
              height: 100,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(width: 1)),
            )));
  }
}
