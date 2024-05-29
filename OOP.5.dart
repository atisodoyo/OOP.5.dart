import 'dart:io';
import 'dart:converter';

//interface
abstract class Printable {
   void printInfo();
}

//Base class
class Animal{
   String name;
   int age;

   Animal(this.name, this.age,);

   void sound(){
    print("The animal makes a sound");
   }
}

//Derived class that implements the interface and override the method
class Dog extends Animal implements Printable {
  Dog(String nmae, int age) : super(name, age);

  @override
  void sound(){
    print("The dog barks.");
  }

  @override
  void printInfo(){
    print("Nmae: $name, Age: $age");
  }
}

//Method that demonstrates the use of a loop
void printAnimals(List<Printable> animals) {
  for (Printable animal in animals) {
    animal.printInfo();
  }
}

void main() async {
  //Read data from a file
  String jsonString= await File('animal.json').readAsString();
  List<dynamic> jsonData = jsonDecode(jsonString);

  //Create a list of animals
  List<Printable> animals =[];
  for(dynamic animalData in jsonData) {
    animals.add(Dog(animalData['name'], animalData['age']));
  }

  /Print the animals
  printAnimals(animals);
}