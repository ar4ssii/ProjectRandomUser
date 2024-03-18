import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'RANDOM_API.dart';
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
  Future<void> getData() async{
    try{
      final response = await http.get(
        Uri.parse(url)
      ).timeout(Duration(seconds: 5));
      user = [jsonDecode(response.body)];
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Homepage()),
      );
    }
    catch(e)
    {
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Message'),
          content: Text('No Internet Connection'),
          actions: [
            TextButton(onPressed: (){
              getData();
              Navigator.pop(context);
            }, child: Text('Retry'))
          ],
        );
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
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


