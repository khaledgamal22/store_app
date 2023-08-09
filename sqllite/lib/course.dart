class Course{
  final int id;
  final String name;
  final String content;
  final int hours;
  Course({required this.id,required this.name,required this.content,required this.hours});

  Map<String,dynamic> toMap(){
    return{
      'id':id,
      'name':name,
      'content':content,
      'hours':hours,
    };
  }
  @override
  String toString(){
    return 'Course{id:$id,name:$name,content:$content,hours:$hours}';
  }
}
