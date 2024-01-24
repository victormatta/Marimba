import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';

void main() => runApp(Marimba());

class Marimba extends StatelessWidget {
  const Marimba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Center(
            child: Text('Marimba',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: marimbaBody(),
      ),
    );
  }
}

class marimbaBody extends StatefulWidget {
  const marimbaBody({super.key});

  @override
  State<marimbaBody> createState() => _marimbaBodyState();
}

class _marimbaBodyState extends State<marimbaBody> {
  late AudioPlayer player; // Declare o player fora do onPressed

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }

  void soundInit(soundNumber) async {
    await player.setAsset('assets/nota${soundNumber}.wav');
    player.play();
  }

   Center createButtom(int soundNumber) {
    return Center(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        height: 80,
        child: GestureDetector(
          onTap: () async {
            soundInit(soundNumber);
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: Colors.black,
              height: 40,
              width: 200,
              margin: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        createButtom(1),
        SizedBox(
          height: 0.5,
        ),
        createButtom(2),
        SizedBox(
          height: 0.5,
        ),
        createButtom(3),
        SizedBox(
          height: 0.2,
        ),
        createButtom(4),
        SizedBox(
          height: 0.3,
        ),
        createButtom(5),
        SizedBox(
          height: 0.4,
        ),
        createButtom(6),
        SizedBox(
          height: 0.3,
        ),
        createButtom(7),
      ],
    );
  }
}