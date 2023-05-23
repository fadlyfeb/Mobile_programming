import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/ui/pages/home_page.dart';
import 'package:airplane/ui/pages/setting_page.dart';
import 'package:airplane/ui/pages/transaction_page.dart';
import 'package:airplane/ui/pages/wallet_page.dart';
import 'package:airplane/ui/widgets/custom_bottom_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingPage();
        default:
          return const HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: 60,
            margin: EdgeInsets.only(
                bottom: 10, left: defaultMargin, right: defaultMargin),
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // ignore: prefer_const_constructors
                CustomBottomNavigationItem(
                  index: 0,
                  imageUrl: 'assets/icon_home.png',
                ),
                // ignore: prefer_const_constructors
                CustomBottomNavigationItem(
                  index: 1,
                  imageUrl: 'assets/icon_booking.png'),
                // ignore: prefer_const_constructors
                CustomBottomNavigationItem(
                  index: 2,
                  imageUrl: 'assets/icon_card.png'),
                // ignore: prefer_const_constructors
                CustomBottomNavigationItem(
                  index: 3,
                  imageUrl: 'assets/icon_setting.png'),
              ],
            ),
          ));
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: kBackgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
