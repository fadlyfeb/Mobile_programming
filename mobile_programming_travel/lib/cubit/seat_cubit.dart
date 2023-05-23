// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';

class SeatCubit extends Cubit<List<String>>{
  SeatCubit() : super([]);

  void selectSeat(String id){
    if(!isSelected(id)){
       state.add(id);
    }else{
      state.remove(id);
    }
    emit(List.from(state));
  }
  bool isSelected(String id){
    int index = state.indexOf(id);
    print('index: $index');
    if(index == -1){
      return false;
    } else {
      return true;
    }
  }

}