import 'package:flutter/material.dart';
import 'package:news_app_c11_maadi/api/api_manager.dart';
import 'package:news_app_c11_maadi/model/NewsResponse/Articles.dart';
import 'package:news_app_c11_maadi/model/article_model.dart';
import 'package:news_app_c11_maadi/ui/category_details/widgets/NewsListWidget/ViewModel/NewsViewModel.dart';
import 'package:provider/provider.dart';

import '../../../../model/SourcesResponse/Source.dart';
import '../ArticleItem.dart';

class NewsListWidget extends StatefulWidget {
  final Source source;
  const NewsListWidget({super.key,required this.source});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  var viewModel = NewsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadNews(widget.source.id??"");
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsViewModel>(
        builder: (context, newsViewModel, child) {
          if(newsViewModel.isLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(newsViewModel.errorMessage!=null){
            return Column(
              children: [
                Text(newsViewModel.errorMessage??""),
                ElevatedButton(onPressed: (){
                  newsViewModel.loadNews(widget.source.id??"");
                }, child: Text("Try Again"))
              ],
            );
          }
          return ListView.separated(
            itemCount:  newsViewModel.articles?.length??0,
            itemBuilder: (BuildContext context, int index)=> ArticleItem(
              article:newsViewModel.articles![index],

            ),
            separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 10,),

          );
        },
      )/*FutureBuilder(
              future: ApiManager.getNews(source.id??""),
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
    );
  }
}
