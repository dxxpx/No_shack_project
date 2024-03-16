import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int tappedimg = -1;
List<String> phones = [
  'Google Pixel 4a',
  'OnePlus 8',
  'Motorola moto g73 5G',
  'Xiaomi 11i',
  'Vivo v2022'
];

BorderRadius mydevice = BorderRadius.circular(25);
BorderRadius topdevice = BorderRadius.vertical(top: Radius.circular(25));
BorderRadius middledevices = BorderRadius.zero;
BorderRadius lastdevice = BorderRadius.vertical(bottom: Radius.circular(25));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //TODO add theme
      home: HomePage(title: 'Find My Device'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find My Device',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF131313),
        actions: const [
          CircleAvatar(
            radius: (20),
            backgroundColor: Color(0xFFED407B),
            child: Text(
              'a',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: Container(
        color: const Color(0xFF131313),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildPContainer(0, mydevice, 'images/Google pixel 4a.png'),
            SizedBox(height: 10),
            buildPContainer(1, topdevice, 'images/OnePlus 8.png'),
            SizedBox(height: 5),
            buildPContainer(
                2, middledevices, 'images/motorola moto g73 5G.png'),
            SizedBox(height: 5),
            buildPContainer(3, middledevices, 'images/Xiaomi mi11.png'),
            SizedBox(height: 5),
            buildPContainer(4, lastdevice, 'images/Vivo v2022.png')
          ],
        ),
      ),
    );
  }

  Widget buildPContainer(int phnno, BorderRadius borderRadius, String phnpath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tappedimg = phnno;
        })
      },
      child: PhnContainer(
          index: phnno, imgpath: phnpath, borderRadius: borderRadius),
    );
  }
}

class PhnContainer extends StatelessWidget {
  PhnContainer({
    Key? key,
    required BorderRadius this.borderRadius,
    required this.index,
    required this.imgpath,
  }) : super(key: key);
  final BorderRadius borderRadius;
  final String imgpath;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 10),
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFF1F2120),
          borderRadius: borderRadius),
      child: Phone_Details(phnno: index, imagepath: imgpath),
    );
  }
}

class Phone_Details extends StatelessWidget {
  Phone_Details({super.key, required this.phnno, required this.imagepath});
  final String imagepath;
  int phnno;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 20),
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xFF0D0F0E),
          ),
          child: Image(
            image: AssetImage(imagepath),
          ),
        ),
        Text(
          phones[phnno],
          style: const TextStyle(color: Colors.white, fontSize: 23),
        ),
      ],
    );
  }
}
