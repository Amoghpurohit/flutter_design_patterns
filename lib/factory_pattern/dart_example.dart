void main() {
  Employee emp = Employee(EmpTypes.dev);
  emp.work();
  
  final ad = FactoryMethod.getEmployeeWorkType(EmpTypes.qa);
  ad.work();
}

enum EmpTypes{
  dev,
  qa,
}

abstract class Employee{
  void work();
  factory Employee(EmpTypes type){             //using a factory constructor
    switch(type){
      case EmpTypes.dev:
        return Dev();
      case EmpTypes.qa:
        return Qa();
      default: throw 'none';
    }
  }
}

class Dev implements Employee{
  @override 
  void work(){
    print('development');
  }
}

class Qa implements Employee{
  @override
  void work(){
    print('quality');
  }
}

class FactoryMethod{
  static Employee getEmployeeWorkType(EmpTypes type){
    switch(type){
      case EmpTypes.dev:
        return Dev();
      case EmpTypes.qa:
        return Qa();
      default: throw 'none';
    }
  }
}