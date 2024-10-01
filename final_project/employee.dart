abstract class employee {
  String? name;
  String? email;
  int? id;
  int? departmentId;
  DateTime? hireDate;
  int preformanceScores = 0;
  double calculateSalary();
  showEmployeeDetails();
  addPreformanceScore(int score);
  subPreformanceScore(int score);
  clearPreformanceScore();
}


class contractEmployee extends employee {
  DateTime? contractEndDate;
  double hourlyRate = 0;
  double hoursWorked = 0;
  contractEmployee({
    required this.contractEndDate,
    required this.hourlyRate,
    this.hoursWorked = 0,
    required String? name,
    required String? email,
    required int? id,
    required int? departmentId,
    required DateTime? hireDate,
    int performanceScores = 0,
  }) {
    this.name = name;
    this.email = email;
    this.id = id;
    this.departmentId = departmentId;
    this.hireDate = hireDate;
    this.preformanceScores = performanceScores;
  }


  ///This function add to the hours worked for the contract employee.
  ///@param Takes one parameter of the type double and adds it to the hoursWorked property.
  void addWorkedHours(double hours) {
    hoursWorked = hours + hoursWorked;
  }


  ///This function add preformnce score if the score is less than five.
  ///The function checks if the score if higher than 5 and if prints a warning.
  @override
  void addPreformanceScore(int score) {
    if (preformanceScores < 5) {
      preformanceScores = score + preformanceScores;
      if(preformanceScores > 5){
        print("Score can´t be any higher than five");
        preformanceScores = preformanceScores - score;
      }
    } else {
      print("Score can´t be any higher than five");
    }
  }


  ///This function subs preformnce score if the score is less than.
  ///The function checks if the score if lesser than zero and if prints a warning.
  @override
  subPreformanceScore(int score) {
    if (preformanceScores > 0) {
      preformanceScores = preformanceScores - score;
      if(preformanceScores < 0){
        print("Score can´t be lower than zero.");
        preformanceScores = preformanceScores + score;
      }
    } else {
      print("Score can´t be lower than zero.");
    }
  }


 ///This function calculates the salary of the contact employee.
  @override
  double calculateSalary() {
    double salary = hourlyRate * hoursWorked;
    return salary;
  }


  ///This function sets the score to zero.
  @override
  clearPreformanceScore() {
    preformanceScores = 0;
  }


 ///This function prints the details about the employee
  @override
  showEmployeeDetails() {
    print("""
Employee name: $name,
Employee id: $id 
Month: ${currentMonth()}
Employee preformance Score: $preformanceScores
""");
  }
}


class permanentEmployee extends employee {
  double salary = 0;
  List<String> benefits;
  permanentEmployee(
      {required String? name,
      required String? email,
      required int? id,
      required int? departmentId,
      required DateTime? hireDate,
      int preformanceScores = 0,
      List<String>? benefits,
      this.salary = 0})
      : benefits = benefits ?? [] {
    this.name = name;
    this.email = email;
    this.id = id;
    this.departmentId = departmentId;
    this.hireDate = hireDate;
    this.preformanceScores = preformanceScores;
  }


  ///This function add preformnce score if the score is less than five.
  ///The function checks if the score if higher than 5 and if prints a warning.
  @override
  void addPreformanceScore(int score) {
    if (preformanceScores < 5) {
      preformanceScores = score + preformanceScores;
      if(preformanceScores > 5){
        print("Score can´t be any higher than five");
        preformanceScores = preformanceScores - score;
      }
    } else {
      print("Score can´t be any higher than five");
    }
  }


  ///This function subs preformnce score if the score is less than.
  ///The function checks if the score if lesser than zero and if prints a warning.
  @override
  subPreformanceScore(int score) {
    if (preformanceScores > 0) {
      preformanceScores = preformanceScores - score;
      if(preformanceScores < 0){
        print("Score can´t be lower than zero.");
        preformanceScores = preformanceScores + score;
      }
    } else {
      print("Score can´t be lower than zero.");
    }
  }


  ///This function sets the score to zero.
  @override
  clearPreformanceScore() {
    preformanceScores = 0;
  }

  @override
  ///print the employee detailes 
  showEmployeeDetails() {
    print("""
Employee name: $name
Employee id: $id
Month: ${currentMonth()}
Employee Preformance Scores: $preformanceScores
""");
  }


  ///add salary to the employee.
  double addSalary(double addedSalary) {
    salary = salary + addedSalary;
    return salary;
  }


///Add a new benefit to the lsit.
  addBenefits(String addedbenefits) {
    if(benefits.contains(addedbenefits)){
      print("The benefit already exists");
    }
    else{benefits.add(addedbenefits);}
  }


  ///@return salary.
  @override
  double calculateSalary() {
    return salary;
  }
}


///This function gets the current month.
///@return a string repersenting the current month.
String currentMonth(){
  DateTime currentDate = DateTime.now();
  int nowMonth = currentDate.month;
  List<String> monthNames = [
    'January', 'February', 'March', 'April', 'May', 'June', 
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  
  return monthNames[nowMonth-1];
}

