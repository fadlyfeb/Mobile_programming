import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/booking_detail.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'succes_checkout_page.dart';

class CheckOutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckOutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/icon_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                       'Ciliwung',
                      style: greyTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetail() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(transaction.destination.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 2),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/icon_star.png',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 10,
                left: 10,
              ),
              child: Text(
                'Booking Details',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
            ),
            BookingDetail(
                title: 'Traveler',
                valueText: '${transaction.amountOfTraveler} person',
                valueColor: kBlackColor),
            BookingDetail(
                title: 'Seat',
                valueText: transaction.selectedSeats,
                valueColor: kBlackColor),
            BookingDetail(
              title: 'Insurance',
              valueText: transaction.insurance ? 'YES' : 'NO',
              valueColor: transaction.insurance ? kGreenColor : kRedColor,
            ),
            BookingDetail(
              title: 'Refundable',
              valueText: transaction.refundable ? 'YES' : 'NO',
              valueColor: transaction.refundable ? kGreenColor : kRedColor,
            ),
            BookingDetail(
                title: 'VAT',
                valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
                valueColor: kBlackColor),
            BookingDetail(
                title: 'Price',
                valueText: NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.price),
                valueColor: kBlackColor),
            BookingDetail(
                title: 'Grand Total',
                valueText: NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.grandTotal),
                valueColor: kPrimaryColor),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kWhiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: kPrimaryColor,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 24,
                                  height: 24,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/logo_plane.png'))),
                                ),
                                Text(
                                  'Pay',
                                  style: whiteTextStyle.copyWith(
                                      fontSize: 16, fontWeight: medium),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                        locale: 'id',
                                        symbol: 'IDR ',
                                        decimalDigits: 0)
                                    .format(state.user.balance),
                                style: blackTextStyle.copyWith(fontSize: 18),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Current Balance',
                                style:
                                    greyTextStyle.copyWith(fontWeight: light),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget payButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if(state is TransactionSuccess){
              Navigator.pushNamedAndRemoveUntil(context, '/success', (route) => false);
            }
            else if(state is TransactionFailed){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content : Text(state.error),
                ),
              );
            }
        },
        builder: (context, state) {

          if(state is TransactionLoading){
            return Container(
              alignment: Alignment.center ,
              margin: const EdgeInsets.only(top: 30) ,
              child: const CircularProgressIndicator(),
              );
          }

          return CustomButton(
            title: 'Pay Now',
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
            margin: const EdgeInsets.only(top: 20, bottom: 20),
          );
        },
      );
    }

    Widget termsConditional() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 20),
        child: Text(
          'Terms Conditional',
          style: greenTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
            decoration: TextDecoration.underline,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [
            route(),
            bookingDetail(),
            paymentDetails(),
            payButton(),
            termsConditional()
          ],
        ),
      ),
    );
  }
}
