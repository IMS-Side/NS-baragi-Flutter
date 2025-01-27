import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegionWeatherCard extends StatelessWidget {
  final bool hasIcon;

  const RegionWeatherCard({super.key, this.hasIcon = false});

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
              const SizedBox(
                width: 175,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "정왕동",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.cloud_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                        SizedBox(width: 4),
                        Text(
                          "88°",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
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
