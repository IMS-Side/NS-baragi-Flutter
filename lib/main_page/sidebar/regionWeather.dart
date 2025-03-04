import 'package:flutter/material.dart';
import 'package:nsbaragi/main_page/modals/addRegionModal.dart';

import '../widgets/regionWetherCard.dart';

class RegionWeather extends StatefulWidget {
  const RegionWeather({super.key});

  @override
  State<RegionWeather> createState() => _RegionWeatherState();
}

class _RegionWeatherState extends State<RegionWeather> {
  final List<Widget> cards = [ //임시로 만든 리스트 나중에 비워놔야함. 맨 위는 현재 위치 고정.
    const RegionWeatherCard(
      key: ValueKey('card1'), //1번이면 hasIcon true
      hasIcon: true,
    ),
    const RegionWeatherCard(
      key: ValueKey('card2'),
    ),
    const RegionWeatherCard(
      key: ValueKey('card3'),
    ),
  ];

  // 추후 API 추가 후 addCard() 사용할 예정.

  // void _addCard() {
  //   setState(() {
  //     cards.add(
  //       RegionWeatherCard(
  //         key: ValueKey('card${cards.length + 1}'),
  //       ),
  //     );
  //   });
  // }

  //지역 리스트의 항목을 삭제하는 함수
  void _removeCard(int index){
    setState(() {
      cards.removeAt(index);
    });
  }

  //모달 창을 띄우는 함수
  void _showAddRegionModal(BuildContext context){
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, //모달 높이 조절 기능
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (context) => AddRegionModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 45),
        ...List.generate(cards.length, (index){
         return Dismissible(
             key: UniqueKey(),
             direction: DismissDirection.endToStart, // 오->왼 스와이트
             onDismissed: (direction){
               _removeCard(index);
             },
           background: Container(
             color: Color(0x30467ABE),
             alignment: Alignment.centerRight,
             padding: const EdgeInsets.only(right: 20),
             child: const Icon(Icons.delete, color: Colors.white,),
           ),
           child: cards[index],
         );
        }),
        const SizedBox(height: 22),
        _addButton(context),
      ],
    );
  }

  Widget _addButton(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 180,
        height: 30,
        child: OutlinedButton(
          onPressed: () => _showAddRegionModal(context),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Color(0xFF898989),
              width: 1.0,
            ),
          ),
          child: const Text(
            "지역 추가",
            style: TextStyle(
              color: Color(0xFF898989),
              fontSize: 10,
              fontFamily: 'PretendardRegular',
            ),
          ),
        ),
      ),
    );
  }
}

