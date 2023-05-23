import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destinations_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChoseSeatPage extends StatelessWidget {
  final DestinationsModel destination;
  const ChoseSeatPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(
          top: 20,
        ),
        child: Row(
          children: [
            //NOTE AVAILABLE
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icon_available.png'))),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),
            //NOTE SELECTED
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6, left: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icon_selected.png'))),
            ),
            Text(
              'Selected',
              style: blackTextStyle,
            ),
            //NOTE UNAVAILABLE
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6, left: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/icon_unavailable.png'))),
            ),
            Text(
              'Unavailable',
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectedSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: kBackgroundColor),
            child: Column(
              children: [
                //Seat Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                //NOTE SEAT 1
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A1',
                        isAvailable: false,
                      ),
                      const SeatItem(
                        id: 'B1',
                        isAvailable: false,
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '1',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C1',
                      ),
                      const SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),
                //NOTE SEAT 2
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A2',
                      ),
                      const SeatItem(
                        id: 'B2',
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C2',
                      ),
                      const SeatItem(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),
                //NOTE SEAT 3
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A3',
                      ),
                      const SeatItem(
                        id: 'B3',
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '3',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C3',
                      ),
                      const SeatItem(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),
                //NOTE SEAT 4
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A4',
                      ),
                      const SeatItem(
                        id: 'B4',
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '4',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C4',
                      ),
                      const SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),
                //NOTE SEAT 5
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const SeatItem(
                        id: 'A5',
                      ),
                      const SeatItem(
                        id: 'B5',
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '5',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                      const SeatItem(
                        id: 'C5',
                      ),
                      const SeatItem(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),
                //Note YouR Seat
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your Seat',
                        style: greenTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      ),
                    ],
                  ),
                ),
                //NOTE Total
                Container(
                  margin: const EdgeInsets.only(top: 16, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greenTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        NumberFormat.currency(
                                locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                            .format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget checkOutButton() {
      // ignore: sized_box_for_whitespace
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            title: 'Continue to Checkout',
            onPressed: () {

              int price = destination.price * state.length;

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckOutPage(
                      TransactionModel(
                        destination: destination,
                        amountOfTraveler: state.length,
                        selectedSeats: state.join(', '),
                        insurance: true,
                        refundable: false,
                        vat : 0.45,
                        price: price ,
                        grandTotal: price + (price * 0.45).toInt(),
                        ),
                    ),
                  ));
            },
            margin: const EdgeInsets.only(top: 30, bottom: 30),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          children: [title(), seatStatus(), selectedSeat(), checkOutButton()],
        ),
      ),
    );
  }
}
