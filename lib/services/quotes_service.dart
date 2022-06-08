import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quotes_bloc/model/quotes_model.dart';

class QuotesService {
  Future<QuotesModel> getQuotes() async {
    var url = Uri.parse('https://api.quotable.io/random');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return QuotesModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load quotes');
    }
  }
}
