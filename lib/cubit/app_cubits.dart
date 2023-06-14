// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubits_states.dart';
import 'package:travel_app/model/data_model.dart';
import 'package:travel_app/services/data_services.dart';

//

class AppCubits extends Cubit<Cubicstates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getinfo();
      emit(LoadedState(places));
    } catch (e) {}
  }

  detailpage(DataModel data) {
    emit(DetailState(data));
  }

  gohome() {
    emit(LoadedState(places));
  }

  gotohome() {
    emit(WelcomeState());
  }
}
