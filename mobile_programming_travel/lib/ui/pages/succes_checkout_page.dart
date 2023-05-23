import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccesCheckOutPage extends StatelessWidget {
  const SuccesCheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 150,
                margin: const EdgeInsets.only(bottom: 60),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image_success.png')
                  )
                ),
              ),
              Text(
                'Well Booked 😍',
                style: blackTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold
                ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Are you ready to explore the new\nworld of experiences?',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light
                  ),
                  textAlign: TextAlign.center,
                  ),
                CustomButton(
                    title: 'My Bookings',
                    width: 220, 
                    onPressed: (){
                      context.read<PageCubit>().setPage(1);
                      Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
                    },
                    margin: const EdgeInsets.only(top: 50.0, bottom: 70.0),
                  ),
            ],
          )
        ),
      ),
    );
  }
}