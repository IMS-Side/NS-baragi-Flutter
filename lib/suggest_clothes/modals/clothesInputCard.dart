import 'package:flutter/material.dart';

class ClothesInputCard extends StatefulWidget {
  const ClothesInputCard({super.key});

  @override
  State<ClothesInputCard> createState() => _ClothesInputCardState();
}

class _ClothesInputCardState extends State<ClothesInputCard> {
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Card(
      color: Colors.transparent,
      elevation: 0.0,
      margin: EdgeInsets.zero,

      child: Container(
        width: size.width * 0.665,
        height: size.height * 0.040,
        decoration: BoxDecoration(
          color: const Color(0xFF467ABE).withOpacity(0.3),
          borderRadius: BorderRadius.circular(30.0),
        ),

        child: Padding(
          padding: const EdgeInsets.all(5.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '추움',
                style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.black),
              ),
              VerticalDivider(
                  color: Color(0xFF95949C),
                  thickness: 1.0),
              Text(
                '좋음',
                style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.black),
              ),
              VerticalDivider(
                  color: Color(0xFF95949C),
                  thickness: 1.0),
              Text(
                '더움',
                style: TextStyle(fontFamily: 'PretendardRegular', fontSize: 10, height: 1.7, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
