import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class Event extends Equatable {
  const Event();
}

class LoadEvent extends Event {
  @override
  List<Object?> get props => [];
}
