part of 'quotes_bloc.dart';

abstract class QuotesState extends Equatable {
  const QuotesState();

  @override
  List<Object> get props => [];
}

class QuotesLoadingState extends QuotesState {}

class QuotesLoadedState extends QuotesState {
  final QuotesModel quotes;

  const QuotesLoadedState({required this.quotes});

  @override
  List<Object> get props => [quotes];

  QuotesLoadedState copyWith({
    QuotesModel? quotes,
  }) {
    return QuotesLoadedState(
      quotes: quotes ?? this.quotes,
    );
  }
}

class QuotesLoadErrorState extends QuotesState {
  final String error;

  const QuotesLoadErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
