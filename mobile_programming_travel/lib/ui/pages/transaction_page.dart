// ignore_for_file: prefer_is_empty

import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSuccess) {
          if (state.transactions.length == 0) {
            return const Center(
              child: Text('Kamu belum memiliki transaksi'),
            );
          } else {
            return ListView.builder(
                itemCount: state.transactions.length,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                itemBuilder: (context, index) {
                  return TransactionCard(
                    state.transactions[index],
                  );
                });
          }
        }

        return const Center(
          child: Text('Transaction Page'),
        );
      },
    );
  }
}