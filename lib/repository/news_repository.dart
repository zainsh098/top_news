import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:top_news/models/news_channel_headlines_model.dart';

class NewsRepository{


  Future<NewsChannelHeadlinesModel>  fetchNewsChannelHeadlinesApi()


  async{


    String url='https://newsapi.org/v2/everything?q=aljazeera&apiKey=6e4c98a895384ebc918adba01fd4004c';
    final response= await http.get(Uri.parse(url));

    if(response.statusCode==200)
      {

        final body=jsonDecode(response.body);
        return NewsChannelHeadlinesModel.fromJson(body);

      }

    throw Exception('Error');



  }

















}