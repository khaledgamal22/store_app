import 'dart:io';

void main(){
  print('inter your birth year');
  var birthYear=stdin.readLineSync();
  var age=DateTime.now().year- num.parse(birthYear!);
  print('age is $age');
}
