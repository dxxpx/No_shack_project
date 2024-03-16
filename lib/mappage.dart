import 'package:flutter/material.dart';
import 'main.dart';

class mapPage extends StatelessWidget {
  mapPage({super.key, required this.phnno, required this.phnpath});
  final int phnno;
  final String phnpath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          build_map_img(),
          Expanded(
            child: Container(
              // height: 410,
              // width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF1B1B1B),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 7.0),
                  build_phn_container(phnno: phnno, phnpath: phnpath),
                  SizedBox(height: 30.0),
                  Options(icon: Icons.multitrack_audio, text: 'Play Sound'),
                  SizedBox(height: 30.0),
                  Options(
                      icon: Icons.lock_outline_sharp, text: 'Secure Device'),
                  SizedBox(height: 30.0),
                  build_Direction_option(
                      icon: Icons.directions, text: 'Get Directions'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class build_Direction_option extends StatelessWidget {
  build_Direction_option({super.key, required this.icon, required this.text});
  IconData icon;
  String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Options(icon: icon, text: text, color: Colors.grey),
        SizedBox(width: 220),
        Icon(
          Icons.ios_share_rounded,
          color: Colors.grey,
          size: 25,
        )
      ],
    );
  }
}

class build_phn_container extends StatelessWidget {
  const build_phn_container({
    super.key,
    required this.phnno,
    required this.phnpath,
  });

  final int phnno;
  final String phnpath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PhnContainer(
            borderRadius: mydevice,
            index: phnno,
            imgpath: phnpath,
            color: blackshade),
        Positioned(
          top: 20,
          right: 30,
          child: Icon(
            Icons.settings,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class build_map_img extends StatelessWidget {
  const build_map_img({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            width: double.infinity,
            height: 400,
            image: AssetImage('images/map.png'),
            fit: BoxFit.cover),
        Positioned(
          top: 10,
          left: 10,
          child: CircleAvatar(
            backgroundColor: Color(0xFF131313),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class Options extends StatelessWidget {
  Options(
      {super.key,
      required this.icon,
      required this.text,
      Color this.color = Colors.white});
  final IconData icon;
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 20.0),
        Icon(icon, size: 25, color: color),
        SizedBox(width: 20.0),
        Text(
          text,
          style: TextStyle(color: color, fontSize: 25),
        )
      ],
    );
  }
}
