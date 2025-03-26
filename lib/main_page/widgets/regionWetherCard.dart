import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegionWeatherCard extends StatelessWidget {
  final bool hasIcon;
  final String region;
  final String temperature;
  final IconData weatherIcon;

  const RegionWeatherCard({
    super.key,
    this.hasIcon = false,
    required this.region,
    required this.temperature,
    required this.weatherIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 23),
        child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 45,
                child: hasIcon
                    ? const Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: 15,
                )
                    : null,
              ),
              SizedBox(
                width: 175,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      region,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'PretendardSemiBold',
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          weatherIcon,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Text(
                          temperature,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'PretendardRegular',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
