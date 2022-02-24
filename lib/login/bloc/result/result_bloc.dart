import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_login/login/bloc/result/result_event.dart';
import 'package:test_login/login/bloc/result/result_state.dart';

import '../../../services/api_services.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  APIService repository;

  ResultBloc({required this.repository}) : super(ResultInitialState()) {
    on<ResultEvent>(_onResultRequested);
  }

  ResultState get initialState => ResultInitialState();

  void _onResultRequested(ResultEvent event, Emitter<ResultState> emit) async {
    try{
      emit(ResultLoadingState());
      await Future.delayed(const Duration(seconds: 2));

      final data = await repository.getResults();

      emit (ResultLoadedState(results: data));
    }catch(e){
      emit (ResultErrorState(message: e.toString(),));
    }

  }
}