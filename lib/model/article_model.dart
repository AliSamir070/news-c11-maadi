class ArticleModel{
  String image;
  String title;
  String source;
  DateTime date;
  ArticleModel({required this.source , required this.title , required this.image , required this.date});

  static List<ArticleModel> articles = [
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", image: "https://images.unsplash.com/photo-1552667466-07770ae110d0?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3", date: DateTime.now()),
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", image: "https://images.unsplash.com/photo-1552667466-07770ae110d0?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3", date: DateTime.now().subtract(Duration(hours: 2))),
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", image: "https://images.unsplash.com/photo-1552667466-07770ae110d0?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3", date: DateTime.now().subtract(Duration(hours: 2))),
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", image: "https://images.unsplash.com/photo-1552667466-07770ae110d0?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3", date: DateTime.now().subtract(Duration(hours: 3))),
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", image: "https://images.unsplash.com/photo-1552667466-07770ae110d0?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3", date: DateTime.now().subtract(Duration(hours: 5))),
    ArticleModel(source: "BBC News", title: "Why are football's biggest clubs starting a new tournament?", image: "https://images.unsplash.com/photo-1552667466-07770ae110d0?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3", date: DateTime.now().subtract(Duration(hours: 7))),

  ];
}