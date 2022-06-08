import 'package:equatable/equatable.dart';

class QuotesModel extends Equatable {
  final String id;
  final List<String> tags;
  final String content;
  final String author;
  final int length;
  final String dateAdded;
  final String dateModified;
  const QuotesModel({
    required this.id,
    required this.tags,
    required this.content,
    required this.author,
    required this.length,
    required this.dateAdded,
    required this.dateModified,
  });

  QuotesModel copyWith({
    String? id,
    List<String>? tags,
    String? content,
    String? author,
    int? length,
    String? dateAdded,
    String? dateModified,
  }) {
    return QuotesModel(
      id: id ?? this.id,
      tags: tags ?? this.tags,
      content: content ?? this.content,
      author: author ?? this.author,
      length: length ?? this.length,
      dateAdded: dateAdded ?? this.dateAdded,
      dateModified: dateModified ?? this.dateModified,
    );
  }

  factory QuotesModel.fromJson(Map<String, dynamic> json) => QuotesModel(
        id: json['_id'] as String,
        tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
        content: json['content'] as String,
        author: json['author'] as String,
        length: json['length'] as int,
        dateAdded: json['dateAdded'] as String,
        dateModified: json['dateModified'] as String,
      );

  @override
  List<Object?> get props => [
        id,
        tags,
        content,
        author,
        length,
        dateAdded,
        dateModified,
      ];
}
