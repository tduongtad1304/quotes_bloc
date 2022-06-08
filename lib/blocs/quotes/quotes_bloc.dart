import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/quotes_model.dart';
import '../../repository/repository.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final QuotesRepository _quotesRepository;
  QuotesBloc(this._quotesRepository) : super(QuotesLoadingState()) {
    on<LoadQuotesEvent>(_loadQuotes);
  }

  FutureOr<void> _loadQuotes(
      LoadQuotesEvent event, Emitter<QuotesState> emit) async {
    emit(QuotesLoadingState());
    try {
      final quotes = await _quotesRepository.fetchQuotes();
      emit(QuotesLoadedState(quotes: quotes));
    } catch (e) {
      emit(QuotesLoadErrorState(error: e.toString()));
    }
  }
}
