import 'dart:async';
import 'package:flutter/material.dart';
// import 'variable.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;

void main()=> runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Loading(),
));
class Loading extends StatefulWidget {
  const Loading({super.key});

  String? get title => null;

  @override
  State<Loading> createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('Project Random User'),
      ),
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Image.network('https://cdn.dribbble.com/users/1152773/screenshots/3832732/media/746ae148587507bc5eadcbf78ecb7d94.gif', height: 300,),
                  Text('Random User API', style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
  
}


