import 'dart:convert';
import 'dart:io';

import 'employee.dart';
import 'hrManager.dart';

class FileManager {
  void exportEmployeesToJson(List<employee> employees, String filePath) {
    List<Map<String, dynamic>> employeeData = employees.map((employee) {
      return {
        'name': employee.name,
        'email': employee.email,
        'id': employee.id,
        'departmentId': employee.departmentId,
        'hireDate': employee.hireDate?.toIso8601String(),
        'performanceScores': employee.preformanceScores,
        'type': employee is contractEmployee ? 'Contract' : 'Permanent',
        if (employee is contractEmployee)
          'hourlyRate': employee.hourlyRate,
        if (employee is contractEmployee)
          'hoursWorked': employee.hoursWorked,
        if (employee is permanentEmployee)
          'salary': employee.salary,
        if (employee is permanentEmployee)
          'benefits': employee.benefits,
      };
    }).toList();

    String jsonData = jsonEncode(employeeData);
    File file = File(filePath);
    file.writeAsStringSync(jsonData);
  }

  List<employee> importEmployeesFromJson(String filePath) {
    File file = File(filePath);
    String jsonData = file.readAsStringSync();
    List<dynamic> employeeData = jsonDecode(jsonData);

    List<employee> employees = employeeData.map((data) {
      if (data['type'] == 'Contract') {
        return contractEmployee(
          contractEndDate: DateTime.now(), 
          hourlyRate: data['hourlyRate'],
          hoursWorked: data['hoursWorked'],
          name: data['name'],
          email: data['email'],
          id: data['id'],
          departmentId: data['departmentId'],
          hireDate: DateTime.parse(data['hireDate']),
          performanceScores: data['performanceScores'],
        );
      } else {
        return permanentEmployee(
          name: data['name'],
          email: data['email'],
          id: data['id'],
          departmentId: data['departmentId'],
          hireDate: DateTime.parse(data['hireDate']),
          preformanceScores: data['performanceScores'],
          benefits: List<String>.from(data['benefits']),
          salary: data['salary'],
        );
      }
    }).toList();

    return employees;
  }

  void exportEmployMonthlyReport(employee employee, String filePath) {
    String report = """
    Employee Monthly Report:
    Name: ${employee.name}
    Email: ${employee.email}
    Department ID: ${employee.departmentId}
    Hire Date: ${employee.hireDate}
    Performance Scores: ${employee.preformanceScores}
    Salary: ${employee.calculateSalary()}
    """;

    File file = File(filePath);
    file.writeAsStringSync(report);
  }

  void generateCompanyReport() {
    print("Company-wide report generation logic...");
  }


  List<employee> getEmployeesByDepartmentId(int departmentId) {
    hrManager HrManager = hrManager();
    return HrManager.getEmployeesByDepartmentId(departmentId);
  }
}
