import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/controllers/geoMapController.dart';


class AddRegionModal extends StatelessWidget {
  AddRegionModal({super.key});

  final GeoMapController _geoMapController = Get.put(GeoMapController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _geoMapController.naverMapService.naverMapInitFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator()); // 초기화 중 로딩 표시
        }

        if (snapshot.hasError || !(snapshot.data ?? false)) {
          return const Center(child: Text("네이버 맵 로딩 실패"));
        }

        return Container(
          height: 576,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              //네이버 맵
              NaverMap(
               options: const NaverMapViewOptions(
                 indoorEnable: true,
                 locationButtonEnable: false,
                 consumeSymbolTapEvents: false,
               ),
                onMapReady: (controller){
                 _geoMapController.setMapController(controller);
                 log("네이버 맵 로딩 완료", name: "onMapReady");
                },
              ),

              // 검색창
              Positioned(
                top: 16,
                left: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: '검색',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                      prefixIcon: Icon(Icons.search, size: 20),
                      prefixIconConstraints: BoxConstraints(
                        minWidth: 40,
                      ),
                    ),
                  ),
                ),
              ),

              // 하단 위치 정보 카드
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Container(
                  width: 316,
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Obx(() => Text(
                               _geoMapController.region3.value,
                               style: const TextStyle(
                                 fontSize: 16,
                                 fontFamily: 'PretendardSemiBold',
                               ),
                              )),
                              SizedBox(height: 6),
                              Obx(()=> Text(
                                _geoMapController.region.value,
                                style: const TextStyle(
                                  fontSize:  13,
                                  color: Color(0xff666666),
                                  fontFamily: 'PretendardRegular',
                                ),
                              ))
                            ],
                          ),
                          const Spacer(),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "2°",
                                style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'PretendardSemiBold',
                                ),
                              ),
                              SizedBox(height: 1),
                              Text(
                                "5° / 4°",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color(0xff666666),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            // 버튼 클릭 시 카드 추가
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            textStyle: const TextStyle(
                              fontFamily: 'PretendardBold',
                              fontSize: 15,
                            ),
                          ),
                          child: const Text("추가"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}