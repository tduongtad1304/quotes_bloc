import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBar(context),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpg'), fit: BoxFit.cover)),
        child: BlocBuilder<QuotesBloc, QuotesState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case QuotesLoadingState:
                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                );
              case QuotesLoadErrorState:
                state as QuotesLoadErrorState;
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.error,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: Colors.white.withOpacity(0.93)),
                      ),
                      const SizedBox(height: 18),
                      QuotesButton(
                        isErrorButton: true,
                        buttonText: 'Retry Connection',
                        onPressed: () =>
                            context.read<QuotesBloc>().add(LoadQuotesEvent()),
                      ),
                    ],
                  ),
                );
              case QuotesLoadedState:
                state as QuotesLoadedState;
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                        child: GlassUI(
                          height: 250,
                          width: 350,
                          child: QuotesBlock(
                            content: state.quotes.content,
                            author: state.quotes.author,
                            tags: state.quotes.tags?.first,
                          ),
                        ),
                      ),
                      const SizedBox(height: 45),
                      QuotesButton(
                        isErrorButton: false,
                        buttonText: 'New quotes',
                        onPressed: () =>
                            context.read<QuotesBloc>().add(LoadQuotesEvent()),
                      ),
                    ],
                  ),
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  PreferredSizeWidget? _appBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(Icons.info),
          onPressed: () => _onInfoPressed(context),
        ),
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: const Text('Quotez Nation', style: TextStyle(fontSize: 20)),
      centerTitle: true,
    );
  }

  void _onInfoPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const InfoDialog(
        width: 300,
        height: 350,
        title: 'Quotez Nation Guide',
        description: [
          '1. Click on the "New quotes" button to get a new quote.',
          '2. Scroll down to read the quote if it is too long.',
          '3. Click the Retry Connection button to retry to get a quote from server.'
        ],
        descriptionNumber: 3,
      ),
    );
  }
}
