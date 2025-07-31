import 'package:app4/Home.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
void main(){
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp

  ]) ;
  runApp(DevicePreview(builder: (context)=>MyApp()));
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomSplash(),
    );
  }
}

class CustomSplash extends StatelessWidget {
  const CustomSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.70, end: 0.0),
      duration: Duration(seconds: 3),
      onEnd: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) =>  Home()),
        );
      },
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Positioned.fill(child:Image(image: NetworkImage('https://plus.unsplash.com/premium_photo-1675603849760-fce371511327?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YXBwJTIwYmFja2dyb3VuZCUyMHdpdGglMjBibGFjayUyMGJhY2tncm91bmR8ZW58MHx8MHx8fDA%3D'),fit:BoxFit.cover,)),
          Transform.translate(
            offset: Offset(0, value*300),
            child: Transform.scale(
              scale:1+value, 
              child: Center(
                child: RichText(text: TextSpan(style:TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),
                children: [
                  TextSpan(text: "I",style:TextStyle(fontSize: 45,color: Colors.red,fontWeight: FontWeight.bold) ),
                  TextSpan(text: "nfo" ),
                  TextSpan(text: "S",style:TextStyle(fontSize: 40,color: Colors.red,fontWeight: FontWeight.bold) ),
                  TextSpan(text: "phere" ),
                ]
                ),
                )
              ),
            ),
          )
            ],
          ),
        );
      },
    );
  }
}


