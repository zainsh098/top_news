import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:top_news/screens/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});


  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 2), () {
      
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));

    });
  }

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height * 1;
    final width=MediaQuery.sizeOf(context).width * 1;





    return  Scaffold(
      body: Column(

        children: [

          SizedBox(height:  height *0.15,),
         Center(
           child: Image.asset('images/splashimage.png',fit: BoxFit.cover,
           height: height * 0.35,
           width: width * 0.95,),
         ),

          SizedBox(height:  height * 0.2,),
          SpinKitFadingCube(color: Colors.amber,
          size: height * 0.065,
          ),





        ],
      ),
      

      
    );
  }
}
