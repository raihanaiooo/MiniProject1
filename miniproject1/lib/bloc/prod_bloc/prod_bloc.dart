import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject1/models/model.dart';
import 'package:miniproject1/service/repo.dart';

part 'prod_state.dart';
part 'prod_event.dart';

class ProdBloc extends Bloc<Event, ProdState> {
  final Repo _repo;

  ProdBloc(this._repo) : super(Loading()) {
    on<LoadEvent>((event, emit) async {
      emit(Loading());

      try {
        final prods = await _repo.getProds();
        emit(Loaded(prods));
      } catch (e) {
        emit(Error(e.toString()));
      }
    });
  }
}
