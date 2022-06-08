import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_bloc/blocs/quotes/quotes_bloc.dart';

import 'repository/quotes_repository.dart';
import 'services/quotes_service.dart';
import 'views/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => QuotesRepository(quotesService: QuotesService()),
      child: BlocProvider<QuotesBloc>(
        create: (context) =>
            QuotesBloc(RepositoryProvider.of<QuotesRepository>(context))
              ..add(LoadQuotesEvent()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quotes',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
