import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class InterestsItem extends StatelessWidget {

  final String name;

  const InterestsItem({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/icon_check.png')
              ),
            ),
          ),
          Text(name,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}