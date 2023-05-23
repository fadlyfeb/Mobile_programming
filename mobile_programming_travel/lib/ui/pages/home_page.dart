import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destinations_cubit.dart';
import 'package:airplane/models/destinations_model.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<DestinationsCubit>().fecthDestinations();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                top: 30,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/image_profile.png'))))
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget popularDestinations(List<DestinationsModel> destinations) {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationsModel destination){
              return DestinationCard(destination);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestinations(List<DestinationsModel> destination) {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Column(
              children: destination.map((DestinationsModel destination){
                return DestinationTile(destination);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return BlocConsumer<DestinationsCubit, DestinationsState>(
      listener: (context, state) {
        if(state is DestinationsFailed){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content : Text(state.error),
                ),
              );
            }
      },
      builder: (context, state) {

        if(state is DestinationsSuccess){
          return ListView(
            children: [
              header(), 
              popularDestinations(state.destinations), 
              newDestinations(state.destinations)
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
        
      },
    );
  }
}
