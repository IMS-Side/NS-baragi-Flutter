import 'package:flutter/material.dart';
import 'package:nsbaragi/suggest_clothes/modals/clothesInputCard.dart';

class ClothesInputCards extends StatefulWidget {
  const ClothesInputCards({super.key});

  @override
  State<ClothesInputCards> createState() => _ClothesInputCardsState();
}

class _ClothesInputCardsState extends State<ClothesInputCards> {
  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.811,
      height: size.height * 0.230,

      child: Stack(
        children: [

          Positioned(
            top: 0,
            left: 0,
            child: Text(
              '아우터',
              style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 16, height: 1.7, color: Colors.black),
            ),
          ),

          Positioned(
            top: size.height * 0.055, left: 0,
            child: Text(
              '후드 집업',
              style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
            ),
          ),
          Positioned(
            top: size.height * 0.044, left: size.width * 0.146,
            child: ClothesInputCard(),
          ),

          Positioned(
            top: size.height * 0.103, left: 0,
            child: Text(
              '후드 집업',
              style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
            ),
          ),
          Positioned(
            top: size.height * 0.090, left: size.width * 0.146,
            child: ClothesInputCard(),
          ),

          Positioned(
            top: size.height * 0.149, left: 0,
            child: Text(
              '후드 집업',
              style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
            ),
          ),
          Positioned(
            top: size.height * 0.135, left: size.width * 0.146,
            child: ClothesInputCard(),
          ),

          Positioned(
            top: size.height * 0.194, left: 0,
            child: Text(
              '후드 집업',
              style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
            ),
          ),
          Positioned(
            top: size.height * 0.181, left: size.width * 0.146,
            child: ClothesInputCard(),
          ),
        ],
      ),
    );
  }
}
