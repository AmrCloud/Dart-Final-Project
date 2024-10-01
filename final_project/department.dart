import 'employee.dart';
interface class department {
  String name;
  int id;
  List<employee> listOfEmployees;
  department(
      {required this.name, required this.id, required this.listOfEmployees});
  addEmployee(employee person) {
    listOfEmployees.add(person);
  }

  removeEmployee(employee person) {
    listOfEmployees.remove(person);
  }

  generateDepartmentReport() {
    print("""
Department name: $name,
Department id: $id
Department Employees: $listOfEmployees
""");
  }
}

///Department 1
class hr implements department {
  @override
  int id = 1;

  @override
  List<employee> listOfEmployees = [];

  @override
  String name = "Human Resourses";


  @override
  addEmployee(employee person) {
    if(listOfEmployees.contains(person)){
      print("This employee already exist in the list.");
    }
    else{listOfEmployees.add(person);}
  }


  @override
  removeEmployee(employee person) {
    if(listOfEmployees.contains(person) == false){
      print("This employee doesn´t exist in the list.");
    }
    else{listOfEmployees.remove(person);}
  }


  @override
  generateDepartmentReport() {
    print("""
Human Resourses
--------------------------------------
Department name: $name,
Department id: $id
Department Employees: 
${listEmployees(listOfEmployees)}
""");
  }
}

///Department 2
class Engineering implements department {
  @override
  int id = 2;

  @override
  List<employee> listOfEmployees = [];

  @override
  String name = " Engineering";

  @override
  addEmployee(employee person) {
    if(listOfEmployees.contains(person)){
      print("This employee already exist in the list.");
    }
    else{listOfEmployees.add(person);}
  }


  @override
  removeEmployee(employee person) {
    if(listOfEmployees.contains(person) == false){
      print("This employee doesn´t exist in the list.");
    }
    else{listOfEmployees.remove(person);}
  }


  @override
  generateDepartmentReport() {
    print("""
Human Resourses
--------------------------------------
Department name: $name,
Department id: $id
Department Employees: 
${listEmployees(listOfEmployees)}
""");
  }
}

///Department 3
class Sales implements department {
  @override
  int id = 3;

  @override
  List<employee> listOfEmployees = [];

  @override
  String name = "Sales";

  @override
  addEmployee(employee person) {
    if(listOfEmployees.contains(person)){
      print("This employee already exist in the list.");
    }
    else{listOfEmployees.add(person);}
  }


  @override
  removeEmployee(employee person) {
    if(listOfEmployees.contains(person) == false){
      print("This employee doesn´t exist in the list.");
    }
    else{listOfEmployees.remove(person);}
  }


  @override
  generateDepartmentReport() {
    print("""
Human Resourses
--------------------------------------
Department name: $name,
Department id: $id
Department Employees: 
${listEmployees(listOfEmployees)}
""");
  }
}


String listEmployees(List<employee> employeeList) {
  String result = '';
  for (employee person in employeeList) {
    result += "${person.name}: ${person.id}: ${person.preformanceScores}\n";
  }
  return result;
}