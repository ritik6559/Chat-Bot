import 'package:chatbot/utils/pallete.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  const FeatureBox({
    super.key,
    required this.description,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontFamily: 'Cera Pro',
                color: Pallete.blackColor,
                fontSize: 18,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            style: const TextStyle(
                fontFamily: 'Cera Pro',
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
