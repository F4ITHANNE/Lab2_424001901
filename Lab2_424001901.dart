import 'dart:io';

// Student class: 3+ attributes and 1 method (Lab requirement 7)
class Student {
  String fullName;
  int idNumber;
  List<double> grades;

  Student(this.fullName, this.idNumber, this.grades);

  // Method: prints the student's basic information
  void displayInfo() {
    print('Name : $fullName');
    print('ID   : $idNumber');
  }
}

// Requirement 6: grade computation wrapped in a function
double computeGrade(List<double> grades) {
  double total = 0;
  for (double g in grades) {
    total += g;
  }
  return total / grades.length;
}

// Reads a valid grade (0-100) from the console, re-asking on bad input
double readGrade(int subjectNumber) {
  while (true) {
    stdout.write('Enter grade for Subject $subjectNumber: ');
    String? input = stdin.readLineSync();
    double? value = double.tryParse(input ?? '');
    if (value != null && value >= 0 && value <= 100) {
      return value;
    }
    print('Invalid grade. Please enter a number from 0 to 100.');
  }
}

void main() {
  print('=== Student Grade Calculator ===');

  // Requirement 1: accept full name, ID number, and 3 subject grades
  stdout.write('Enter full name: ');
  String fullName = (stdin.readLineSync() ?? '').trim();

  int? idNumber;
  while (idNumber == null) {
    stdout.write('Enter ID number: ');
    idNumber = int.tryParse((stdin.readLineSync() ?? '').trim());
    if (idNumber == null) {
      print('Invalid ID. Please enter numbers only.');
    }
  }

  List<double> grades = [];
  for (int i = 1; i <= 3; i++) {
    grades.add(readGrade(i));
  }

  // Requirement 7: instantiate Student in main()
  Student student = Student(fullName, idNumber, grades);

  // Requirement 3: compute average using arithmetic operators
  double average = computeGrade(student.grades);

  // Requirement 4: if-else ladder for status
  String status;
  if (average >= 75) {
    status = 'Passed';
  } else if (average >= 70) {
    status = 'Conditional';
  } else {
    status = 'Failed';
  }

  // Output
  print('\n=== Grade Report ===');
  student.displayInfo();

  // Requirement 5: for loop displays all 3 grades in a formatted list
  print('Grades:');
  for (int i = 0; i < student.grades.length; i++) {
    print('  Subject ${i + 1}: ${student.grades[i].toStringAsFixed(2)}');
  }

  print('Average: ${average.toStringAsFixed(2)}');
  print('Status : $status');
}
