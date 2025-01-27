import 'package:flutter/material.dart';
import 'package:nsbaragi/suggest_clothes/modals/clothesInputCards.dart';

class ClothesInputModal extends StatelessWidget {
  const ClothesInputModal({super.key});

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.031),

      child: Container(
          width: size.width * 0.937,
          height: size.height * 0.639,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFE4F1FF),
            borderRadius: BorderRadius.circular(20.0),
          ),

          child: Stack(
            children: [

              Positioned(
                top: size.height * 0.017,
                right: size.width * 0.032,
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                  size: size.height * 0.033,
                ),
              ),

              Positioned(
                top: size.height * 0.050,
                left: size.width * 0.063,
                child: Text(
                  '현재 입은 옷을 입력해 주세요.',
                  style: TextStyle(fontFamily: 'PretendardBold', fontSize: 18, height: 1.7, color: Colors.black),
                ),
              ),

              Positioned(
                top: size.height * 0.098,
                left: size.width * 0.063,
                child: SizedBox(
                  height: size.height * 0.542,

                  child: SingleChildScrollView(

                    child: Column(
                      children: [

                        ClothesInputCards(),

                        SizedBox(height: size.height * 0.030,),

                        ClothesInputCards(),

                        SizedBox(height: size.height * 0.030,),

                        ClothesInputCards(),

                        SizedBox(height: size.height * 0.050,),

                        Align(
                          alignment: Alignment(0.0, 1.0),

                          child: ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1A3761),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.303, vertical: size.height * 0.008),
                            ),
                            child: Text(
                              '완료',
                              style: TextStyle(fontFamily: 'PretendardBold', fontSize: 13, height: 1.7, color: Colors.white),
                            ),
                          ),
                        ),

                        SizedBox(height: size.height * 0.050,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
      ),
    );
  }
}
