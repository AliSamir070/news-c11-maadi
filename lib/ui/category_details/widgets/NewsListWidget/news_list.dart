import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_c11_maadi/api/api_manager.dart';
import 'package:news_app_c11_maadi/model/NewsResponse/Articles.dart';
import 'package:news_app_c11_maadi/model/article_model.dart';
import 'package:news_app_c11_maadi/ui/category_details/widgets/NewsListWidget/ViewModel/NewsViewModel.dart';

import '../../../../model/SourcesResponse/Source.dart';
import '../ArticleItem.dart';

class NewsListWidget extends StatefulWidget {
  final Source source;

  const NewsListWidget({super.key, required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsViewModel.loadArticles(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsViewModel,
      child: BlocBuilder<NewsViewModel, NewsStates>(
        builder: (context, state) {
          switch (state) {
            case NewsInitialState():
              {
                return Container();
              }
            case NewsLoadingState():
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            case NewsSuccessState():
              {
                return ListView.separated(
                  itemCount: state.articles.length,
                  itemBuilder: (BuildContext context, int index) => ArticleItem(
                    article: state.articles[index],
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 10,
                  ),
                );
              }
            case NewsErrorState():
              {
                return Column(
                  children: [
                    Text(state.error),
                    ElevatedButton(
                        onPressed: () {
                          newsViewModel.loadArticles(widget.source.id ?? "");
                        },
                        child: Text("Try Again"))
                  ],
                );
              }
          }
        },
      ),
    )

        /*FutureBuilder(
      future: ApiManager.getNews(widget.source.id??""),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        if(snapshot.hasError || snapshot.data?.status == "error"){
          return Column(
            children: [
              Text(snapshot.data?.message??snapshot.error.toString()),
              ElevatedButton(onPressed: (){
                setState(() {

                });
              }, child: Text("Try Again"))
            ],
          );
        }
        List<Article> articles = snapshot.data?.articles??[];
        return ListView.separated(
          itemCount:  articles.length,
          itemBuilder: (BuildContext context, int index)=> ArticleItem(
            article:articles[index],

          ),
          separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 10,),

        );
      },)*/
        ;
  }
}
