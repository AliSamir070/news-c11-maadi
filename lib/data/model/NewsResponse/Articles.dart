import 'package:hive/hive.dart';

import '../SourcesResponse/Source.dart';
part 'Articles.g.dart';
/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "BBC Radio 4"
/// title : "Catherine Bohart: TL;DR - 5. Are we going to see Robert Jenrick's Brat Summer?"
/// description : "Confused by candidates? If you're feeling adrift ahead of the Conservative leadership election, TL;DR has done the reading for you.Alex Kealy joins Catherine Bohart to look at the runners and riders. In the sidebar, Russian stand-up Olga Koch looks at why a s…"
/// url : "https://www.bbc.co.uk/programmes/p0jk5kdh"
/// urlToImage : "https://ichef.bbci.co.uk/images/ic/1200x675/p0jdks1v.jpg"
/// publishedAt : "2024-08-30T17:30:00Z"
/// content : "Confused by candidates? If you're feeling adrift ahead of the Conservative leadership election, TL;DR has done the reading for you.\r\nAlex Kealy joins Catherine Bohart to look at the runners and rider… [+510 chars]"
@HiveType(typeId: 1)
class Article extends HiveObject {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  @HiveField(0)
  Source? source;
  @HiveField(1)
  String? author;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? url;
  @HiveField(5)
  String? urlToImage;
  @HiveField(6)
  String? publishedAt;
  @HiveField(7)
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}