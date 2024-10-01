import 'department.dart';
import 'employee.dart';
import 'hrManager.dart';
void main(){
  permanentEmployee salem = permanentEmployee(name: "Salem", email: "Salem@gmail.com", id: 1001, departmentId: 1, hireDate: DateTime(2022,5,12));
  permanentEmployee saad = permanentEmployee(name: "Saad", email: "Saad@gmail.com", id: 1001, departmentId: 1, hireDate: DateTime(2022,5,12));
  permanentEmployee samy = permanentEmployee(name: "Samy", email: "Samy@gmail.com", id: 1001, departmentId: 2, hireDate: DateTime(2022,5,12));
  permanentEmployee said = permanentEmployee(name: "Said", email: "Said@gmail.com", id: 1001, departmentId: 2, hireDate: DateTime(2022,5,12));
  permanentEmployee salma = permanentEmployee(name: "Salma", email: "Salma@gmail.com", id: 1001, departmentId: 3, hireDate: DateTime(2022,5,12));
  permanentEmployee sandy = permanentEmployee(name: "Sandy", email: "Sandy@gmail.com", id: 1001, departmentId: 2, hireDate: DateTime(2022,5,12));
  hr humanResources = hr();
  humanResources.addEmployee(salem);
  humanResources.addEmployee(saad);
  humanResources.generateDepartmentReport();
  humanResources.removeEmployee(saad);
  humanResources.removeEmployee(saad);
  humanResources.addEmployee(salem);
  humanResources.generateDepartmentReport();

}