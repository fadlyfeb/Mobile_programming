import 'package:airplane/services/destinaation_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/destinations_model.dart';

part 'destinations_state.dart';

class DestinationsCubit extends Cubit<DestinationsState> {
  DestinationsCubit() : super(DestinationsInitial());

  void fecthDestinations() async{
    try {
      emit(DestinationsLoading());

      List<DestinationsModel> destinations = await DestinationService().fecthDestinations();

      emit(DestinationsSuccess(destinations));
    } catch (e) {
      emit(DestinationsFailed(e.toString()));
    }
  }
}
