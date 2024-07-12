import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miniproject1/bloc/product/prod_event.dart';
import 'package:miniproject1/bloc/product/prod_state.dart';
import 'package:miniproject1/services/product/repo.dart';

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
