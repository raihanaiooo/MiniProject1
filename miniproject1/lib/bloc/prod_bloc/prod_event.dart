part of 'prod_bloc.dart';

@immutable
abstract class Event extends Equatable {
  const Event();
}

class LoadEvent extends Event {
  @override
  List<Object?> get props => [];
}
