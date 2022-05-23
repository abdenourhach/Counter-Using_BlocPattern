import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CounterEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class IncreamentEvents extends CounterEvents {}

class lockEvents extends CounterEvents {}
