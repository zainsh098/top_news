

import 'package:top_news/models/news_channel_headlines_model.dart';
import 'package:top_news/repository/news_repository.dart';

class NewsViewModel{

  final _rep=NewsRepository();

  Future<NewsChannelHeadlinesModel>  fetchNewsChannelHeadlinesApi()
  async{

    final response= await _rep.fetchNewsChannelHeadlinesApi();
    return response;







  }








}