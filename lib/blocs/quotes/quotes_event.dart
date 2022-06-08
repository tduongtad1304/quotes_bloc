part of 'quotes_bloc.dart';

abstract class QuotesEvent extends Equatable {
  const QuotesEvent();

  @override
  List<Object> get props => [];
}

class LoadQuotesEvent extends QuotesEvent {}
