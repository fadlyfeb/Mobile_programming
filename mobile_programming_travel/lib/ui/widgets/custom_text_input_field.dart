import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String title;
  final String hinttext;
  final bool obscuretext;
  final TextEditingController controller;
  const CustomTextFormField({
    Key? key,
    required this.title,
    required this.hinttext,
    this.obscuretext = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: blackTextStyle.copyWith(
            fontSize: 14,
            fontWeight: regular,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        TextFormField(
          cursorColor: kBlackColor,
          obscureText: obscuretext,
          controller: controller,
          decoration: InputDecoration(
          hintText: hinttext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(defaultRadius),
          borderSide: const BorderSide(
          color: kPrimaryColor
           ), 
          ),
          ),
        ),
      ],
      ),
    );
  }
}