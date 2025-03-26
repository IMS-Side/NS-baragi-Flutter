import 'package:flutter/material.dart';
import 'package:nsbaragi/apparent_weather/modals/weatherInputCard.dart';

class WeatherInputModal extends StatelessWidget {
  const WeatherInputModal({super.key});

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

            Align(
              child: Container(
                width: size.width * 0.811,
                height: size.height * 0.417,

                child: Stack(
                  children: [

                    Text(
                      '현재 체감 날씨를 입력해 주세요.',
                      style: TextStyle(fontFamily: 'PretendardBold', fontSize: 18, height: 1.7, color: Colors.black),
                    ),

                    Positioned(
                        top: size.height * 0.055,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              width: size.width * 0.1,
                              height: size.height * 0.019,
                              alignment: Alignment.center,
                              child: Text(
                                '비',
                                style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
                              ),
                            ),

                            WeatherInputCard(),
                          ],
                        )
                    ),

                    Positioned(
                        top: size.height * 0.112,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              width: size.width * 0.1,
                              height: size.height * 0.019,
                              alignment: Alignment.center,
                              child: Text(
                                '비',
                                style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
                              ),
                            ),

                            WeatherInputCard(),
                          ],
                        )
                    ),

                    Positioned(
                        top: size.height * 0.169,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              width: size.width * 0.1,
                              height: size.height * 0.019,
                              alignment: Alignment.center,
                              child: Text(
                                '비',
                                style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
                              ),
                            ),

                            WeatherInputCard(),
                          ],
                        )
                    ),

                    Positioned(
                        top: size.height * 0.225,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              width: size.width * 0.1,
                              height: size.height * 0.019,
                              alignment: Alignment.center,
                              child: Text(
                                '비',
                                style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
                              ),
                            ),

                            WeatherInputCard(),
                          ],
                        )
                    ),

                    Positioned(
                        top: size.height * 0.282,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Container(
                              width: size.width * 0.1,
                              height: size.height * 0.019,
                              alignment: Alignment.center,
                              child: Text(
                                '비',
                                style: TextStyle(fontFamily: 'PretendardSemiBold', fontSize: 10, height: 1.7, color: Colors.black),
                              ),
                            ),

                            WeatherInputCard(),
                          ],
                        )
                    ),

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
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
