import 'package:flutter/material.dart';
import 'package:sqllite/newcourse.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        title:Text('SQl DataBase') ,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewCourse()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: null,
    );
  }
}
