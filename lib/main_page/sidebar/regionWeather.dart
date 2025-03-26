import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nsbaragi/main_page/controllers/regionWeatherController.dart';
import 'package:nsbaragi/main_page/sidebar/modals/addRegionModal.dart';

import '../widgets/regionWetherCard.dart';

class RegionWeather extends StatelessWidget {
  RegionWeather({super.key});

  final RegionWeatherController _regionWeatherController = Get.put(RegionWeatherController());

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 45,),

        //현재 위치 카드
        Obx(() => RegionWeatherCard(
          key: const ValueKey('currentLocation'),
          region: _regionWeatherController.crntLocation.value,
          temperature: _regionWeatherController.crntTemp.value,
          weatherIcon: _regionWeatherController.crntIcon.value,
        )),

        Obx(() => Column(
          children: List.generate(
          _regionWeatherController.searchCards.length,
              (index) => Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction){
                    _regionWeatherController.removeCard(index);
                  },
                  background: Container(
                    color: const Color(0x30467ABE),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                  ),
                  child: _regionWeatherController.searchCards[index]
              ),
          ),
        )),

        const SizedBox(height: 22,),
        _addButton(context),
      ],
    );
  }

  Widget _addButton(BuildContext context){
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

  void _showAddRegionModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => AddRegionModal(
        onRegionSelected: (region, temperature, weatherIcon) {
          _regionWeatherController.addCard(region, temperature, weatherIcon);
        },
      ),
    );
  }

}





