import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_get_started.png'
                  ),
                  fit: BoxFit.cover
                   ), 
                ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end ,
              children: [
               Text(
                'Fly Like a Bird',
                style: whiteTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: semiBold
                ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Explore new world with us and let\nyourself get an amazing experiences',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light
                  ),
                  textAlign: TextAlign.center,
                  ),
                  CustomButton(
                    title: 'Get Started',
                    width: 220, 
                    onPressed: (){
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    margin: const EdgeInsets.only(top: 50.0, bottom: 70.0),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}