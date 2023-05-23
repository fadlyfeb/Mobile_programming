import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class BookingDetail extends StatelessWidget {

  final String title;
  final String valueText;
  final Color valueColor;


  const BookingDetail({
    Key? key,
    required this.title,
    required this.valueText,
    required this.valueColor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
          return Container(
            margin: const EdgeInsets.only(top: 10,left: 10 ),
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
                      )
                    ),
                  ),
                  Text(title,
                    style: blackTextStyle,
                  ),
                  const Spacer(),
                  Text(valueText,
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      color: valueColor
                    ),
                  ),
                ],
              ),
          );
  }
}