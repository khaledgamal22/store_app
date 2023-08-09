import 'package:flutter/material.dart';
class NewCourse extends StatefulWidget {
  const NewCourse({Key? key}) : super(key: key);

  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  String name='';
  String content='';
  int coursehours=0;
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('add new course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'course name'
                ),
                onChanged: (value){
                  setState(() {
                    name=value;
                  });
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: 'course content'
                ),
                onChanged: (value){
                  setState(() {
                    content=value;
                  });
                },
              ),
              SizedBox(height: 15,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'hours of course'
                ),
                onChanged: (value){
                  setState(() {
                    coursehours=int.parse(value);
                  });
                },
              ),
              SizedBox(height: 15,),
              ElevatedButton(
                  onPressed: (){

                  },
                  child: Text('Save')
              )
            ],
          ),
        ),
      ),
    );
  }
}
