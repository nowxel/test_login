import 'package:equatable/equatable.dart';
import 'package:test_login/login/models/result_model.dart';

abstract class ResultState extends Equatable{}

class ResultInitialState extends ResultState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class ResultLoadingState extends ResultState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class ResultLoadedState extends ResultState{
  ResultModel results;
  ResultLoadedState({required this.results});

  @override
  // TODO: implement props
  List<Object?> get props => [results];
}

class ResultErrorState extends ResultState {
  String message;

  ResultErrorState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}