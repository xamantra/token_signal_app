import 'dart:convert';

class NewsData {
  NewsData({
    required this.id,
    required this.title,
    required this.url,
    required this.timestamp,
    required this.sourceName,
  });

  final String id;
  final String title;
  final String url;
  final int timestamp;
  final String sourceName;

  NewsData copyWith({
    String? id,
    String? title,
    String? url,
    int? timestamp,
    String? sourceName,
  }) =>
      NewsData(
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        timestamp: timestamp ?? this.timestamp,
        sourceName: sourceName ?? this.sourceName,
      );

  factory NewsData.fromRawJson(String str) => NewsData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsData.fromJson(Map<String, dynamic> json) => NewsData(
        id: json["id"] ?? '',
        title: json["title"] ?? '',
        url: json["url"] ?? '',
        timestamp: json["timestamp"] ?? 0,
        sourceName: json["sourceName"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "timestamp": timestamp,
        "sourceName": sourceName,
      };
}
