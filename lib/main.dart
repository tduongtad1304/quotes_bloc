import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quotes_bloc/quotes_observer.dart';

import 'app.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: QuotesObserver());
}
