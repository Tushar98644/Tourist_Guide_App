// ignore_for_file: unused_import, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/model/data_model.dart';

abstract class Cubicstates extends Equatable {}

class InitialState extends Cubicstates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends Cubicstates {
  @override
  List<Object> get props => [];
}

class LoadingState extends Cubicstates {
  @override
  List<Object> get props => [];
}

class LoadedState extends Cubicstates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

class DetailState extends Cubicstates {
  DetailState(this.places);
  final DataModel places;
  @override
  List<Object> get props => [places];
}
