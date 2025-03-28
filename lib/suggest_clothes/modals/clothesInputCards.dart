import 'package:flutter/material.dart';
import 'package:nsbaragi/suggest_clothes/modals/clothesInputCard.dart';

class ClothesInputCards extends StatefulWidget {
  final String category;
  final List<String> clothesList;

  const ClothesInputCards({
    super.key,
    required this.category,
    required this.clothesList,
  });

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
              widget.category,
              style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 16, height: 1.7, color: Colors.black),
            ),
          ),

          for (int i = 0; i < widget.clothesList.length; i++) ...[
            Positioned(
              top: size.height * (0.055 + (i * 0.047)),
              left: 0,
              child: Text(
                widget.clothesList[i],
                style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
              ),
            ),
            Positioned(
              top: size.height * (0.044 + (i * 0.047)),
              left: size.width * 0.146,
              child: ClothesInputCard(),
            ),
          ],
        ],
      ),
    );
  }
}
