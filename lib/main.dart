import 'package:floating_dots/floating_dots.dart';
import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
      theme: ThemeData(
        brightness: Brightness.dark
      ),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: slimyCard.stream,
          initialData: false,
          builder: ((BuildContext context, AsyncSnapshot snapshot){
            return ListView(
              children: [
                SizedBox(height: 100,),
                SlimyCard(
                  slimeEnabled: true,
                  topCardWidget: topWidget((snapshot.data) ? 'assets/image1.png' : 'assets/image2.png'),
                  bottomCardWidget: bottomWidget(),
                  color: Colors.amber,
                ),
              ],
            );
          })
      )
    );
  }

  Widget topWidget(String imagePath){
    return Column(
      children: [
        SizedBox(height: 10.0,),
        Padding(padding: EdgeInsets.all(10.0),
        child: Center(
          child: Text('What did you do Today?',style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),),
        ),),
        SizedBox(height: 10.0,),
        Container(
         height: 100,
         width: 100,
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(15.0),
           boxShadow: [
             BoxShadow(
               color: Colors.white.withOpacity(0.1),
               spreadRadius: 2,
               blurRadius: 20.0
             ),
           ],
           image: DecorationImage(image: AssetImage(imagePath)),
         ),
        ),
        SizedBox(height: 15.0,),
        Center(
          child: Text('Want to know what i did?',style: TextStyle(color: Colors.black),),
        ),
      ],
    );
  }

  Widget bottomWidget(){
    return Stack(
      children: [
        FloatingDotGroup(
          size: DotSize.small,
          speed: DotSpeed.slow,
          direction: Direction.up,
          colors: [
            Colors.blue,
            Colors.red,
            Colors.green,
            Colors.deepPurple,
            Colors.deepOrange
          ],
          trajectory: Trajectory.random,
          opacity: 0.5,
        ),
        Center(
          child: Text('Nothing, LOL',style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.black,
            fontSize: 30.0,
          ),),
        )
      ],
    );
  }
}

















