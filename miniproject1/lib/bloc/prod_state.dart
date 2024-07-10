import 'package:equatable/equatable.dart';
import 'package:miniproject1/bloc/prod_bloc.dart';
import 'package:miniproject1/model/model.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProdState extends Equatable {}

class Loading extends ProdState {
  @override
  List<Object?> get props => [];
}

class Loaded extends ProdState {
  final List<Model> models;
  Loaded(this.models);
  @override
  List<Object?> get props => [models];
}

class Error extends ProdState {
  final String error;
  Error(this.error);
  @override
  List<Object?> get props => [error];
}
