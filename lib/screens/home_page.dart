import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_news/models/news_channel_headlines_model.dart';
import 'package:top_news/view%20model/news_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
              onPressed: () {},
              icon: Image.asset(
                'images/category1.png',
                height: height * 0.04,
                width: width * 0.1,
              )),
        ),
        centerTitle: true,
        title: Text('News',
            style: GoogleFonts.poppins(
              fontSize: height * 0.04,
              fontWeight: FontWeight.w700,
            )),
      ),
      body:ListView(
        children: [

          SizedBox(
            height:  height * .55,
            width: width ,
            child:  FutureBuilder<NewsChannelHeadlinesModel>(

                future:newsViewModel.fetchNewsChannelHeadlinesApi(), builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting)
                    {
                      return Center(child: SpinKitFadingCube(color: Colors.amber,size: height * 0.065,));


                    }
                  else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.articles!.length,

                      itemBuilder: (context, index) {
                      return SizedBox(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [

                            Container(
                              height:  height * 0.6,
                              width:  width *.92,
                              padding: EdgeInsets.symmetric(horizontal: height * 0.01),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                
                                child: CachedNetworkImage(imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                                fit: BoxFit.fill,
                                  placeholder:(context,url)=> Container(child: SpinKitFadingFour(color: Colors.amber,)),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                            Positioned(
                             bottom: 20,


                              child: Card(

                                shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10),



                                ),
                                child: Container(
                                  alignment: Alignment.bottomCenter,
                                  height:  height * 0.20,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [


                                      Container(
                                        width:  width * 0.8,
                                        height:  height * 0.1,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 4,right: 4),
                                          child: Text(snapshot.data!.articles![index].title.toString(),textAlign: TextAlign.center,softWrap: true,
                                          overflow: TextOverflow.fade,
                                          maxLines: 3 ,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,




                                          ),
                                          ),
                                        ),
                                      ),
                                   SizedBox(height: height * 0.04,),
                                      Container(
                                        child:
                                        Row(children: [


                                          Text(snapshot.data!.articles![index].source!.name.toString(),textAlign: TextAlign.center,softWrap: true,
                                            overflow: TextOverflow.fade,
                                            maxLines: 3 ,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,




                                            ),
                                          ),
                                          SizedBox(width:  width* 0.02,),
                                          Text(snapshot.data!.articles![index].publishedAt.toString(),textAlign: TextAlign.center,softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3 ,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 13,




                                            ),
                                          ),


                                        ],)
                                        ,

                                      )


                                    ],

                                  ),
                                ),

                              ),
                            )



                          ],

                        ),
                      );

                    },);

                  }

                },),

          ),




        ],


      )
    );
  }
}
