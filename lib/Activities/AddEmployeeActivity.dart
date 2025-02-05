import 'package:flutter/material.dart';

class AddEmployeeActivity extends StatefulWidget {
  const AddEmployeeActivity({super.key});

  @override
  AddEmployeeState createState() => AddEmployeeState();

}

class AddEmployeeState extends State<AddEmployeeActivity> {
  final addEmployeeFormKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();

  showSnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: message)
    );
  }

  validateInput(condition, message) {
    if (condition) {
      return message;
    }
    return null;
  }

  addEmployee() {
    if (addEmployeeFormKey.currentState!.validate()) {
      print("Name: ${nameController.text}");
      print("Age: ${ageController.text}");
      print("Salary: ${salaryController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
      ),
      body: Form(
        key: addEmployeeFormKey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  var condition = value == null || value.isEmpty;
                  return validateInput(condition, 'Invalid name');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age',
                ),
                validator: (value) {
                  var condition = value == null || value.isEmpty || int.tryParse(value) == null;
                  return validateInput(condition, 'Invalid age');
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: salaryController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Salary',
                ),
                validator: (value) {
                  var condition = value == null || value.isEmpty || double.tryParse(value) == null;
                  return validateInput(condition, 'Invalid salary');
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: ElevatedButton( // contact add button
                  onPressed: () {addEmployee();},
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.blueGrey,
                      minimumSize: Size(100, 40),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                  child: Text('Add Employee', style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),),
                )
            ),
          ],
        ),
      ),
    );
  }

}