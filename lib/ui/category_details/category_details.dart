import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_c11_maadi/api/api_manager.dart';
import 'package:news_app_c11_maadi/ui/category_details/ViewModel/CategoryDetailsViewModel.dart';
import 'package:news_app_c11_maadi/ui/category_details/widgets/NewsListWidget/news_list.dart';
import 'package:news_app_c11_maadi/ui/category_details/widgets/source_tab.dart';
import 'package:provider/provider.dart';

import '../../model/SourcesResponse/Source.dart';

class CategoryDetailsTab extends StatefulWidget {
  String categoryId;

  CategoryDetailsTab({super.key, required this.categoryId});

  @override
  State<CategoryDetailsTab> createState() => _CategoryDetailsTabState();
}

class _CategoryDetailsTabState extends State<CategoryDetailsTab> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.loadSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, categoriesDetailsViewModel, child) {
          if (categoriesDetailsViewModel.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (categoriesDetailsViewModel.errorMessage != null) {
            return Column(
              children: [
                Text(categoriesDetailsViewModel.errorMessage ?? ""),
                ElevatedButton(
                    onPressed: () {
                      categoriesDetailsViewModel.loadSources(widget.categoryId);
                    },
                    child: Text("Try Again"))
              ],
            );
          }
          return DefaultTabController(
            length: categoriesDetailsViewModel.sourcesList?.length ?? 0,
            child: Column(
              children: [
                TabBar(
                    padding: EdgeInsets.all(16),
                    tabAlignment: TabAlignment.start,
                    labelColor: Colors.white,
                    dividerHeight: 0,
                    unselectedLabelColor: Theme.of(context).colorScheme.primary,
                    isScrollable: true,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary),
                        color: Theme.of(context).colorScheme.primary),
                    tabs: categoriesDetailsViewModel.sourcesList
                            ?.map((source) => SourceTabWidget(
                                  source: source,
                                ))
                            .toList() ??
                        []),
                Expanded(
                    child: TabBarView(
                        children: categoriesDetailsViewModel.sourcesList
                                ?.map((source) => NewsListWidget(
                                      source: source,
                                    ))
                                .toList() ??
                            []))
              ],
            ),
          );
        },
      ),
    );
    /*return FutureBuilder(
        future: ApiManager.getSources(widget.categoryId),
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
          List<Source> sources = snapshot.data?.sources??[];
          return DefaultTabController(
            length: sources.length,
            child: Column(
              children: [
                TabBar(
                    padding: EdgeInsets.all(16),
                    tabAlignment: TabAlignment.start,
                    labelColor: Colors.white,
                    dividerHeight: 0,
                    unselectedLabelColor: Theme.of(context).colorScheme.primary,
                    isScrollable: true,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Theme.of(context).colorScheme.primary),
                        color: Theme.of(context).colorScheme.primary
                    ),
                    tabs: sources.map((source) => SourceTabWidget(source: source,)).toList()
                ),
                NewsListWidget(sourceNames: sources,)
              ],
            ),
          );
        },
    );*/
  }
}
