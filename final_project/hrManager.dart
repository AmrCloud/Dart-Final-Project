import 'department.dart';
import 'employee.dart';
class hrManager {
  Map<int,department> departemnts = {};
  Map<int,employee> employees = {};

  void addDepartment(int id,department section){
    departemnts[id] = section;
  }
  void addEmployee(int id,employee person){
    employees[id] = person;
  }
  void deleteEmployee(int id){
    employees.remove(id);
  }
  employee? getEmployeeByID(int id){
    return employees[id];
  }
  void generateDepartmentReport(){
    departemnts.forEach((key, value) {
      print("""
Department Id: $key, Department name: $value
""");
    },);
    employees.forEach((key, value) {
            print("""
Employee Id: $key, Employee name: $value
""");
    },);
  }

    List<employee> getEmployeesByDepartmentId(int departmentId) {
      List<employee> departmentEmployees = [];
      employees.forEach((id, employee) {
        if (employee.departmentId == departmentId) {
          departmentEmployees.add(employee);
        }
      });
      return departmentEmployees;
  }
}
