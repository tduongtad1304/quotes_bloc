import 'package:quotes_bloc/model/quotes_model.dart';

import '../services/services.dart';

class QuotesRepository {
  final QuotesService quotesService;
  QuotesRepository({
    required this.quotesService,
  });

  Future<QuotesModel> fetchQuotes() async {
    try {
      final QuotesModel quotes = await quotesService.getQuotes();
      return quotes;
    } catch (e) {
      throw Exception('Failed to load quotes');
    }
  }
}
