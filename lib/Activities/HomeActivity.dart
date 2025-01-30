import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  HomeActivityState createState() => HomeActivityState();
}

class HomeActivityState extends State<HomeActivity> {
  static const String title = 'Contact List';
  List<Map<String,String>> contactList = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  showSnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: message)
    );
  }

  addContact() {
    if (nameController.text.isNotEmpty && numberController.text.isNotEmpty) {
      setState(() {
        contactList.add({
          'name': nameController.text,
          'number': numberController.text,
        });
      });
      nameController.clear();
      numberController.clear();
    }
  }

  deleteContactWithAlert(context, index) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: Text('Confirmation'),
              content: Text('Are you sure for Delete?'),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.cancel_outlined, color: Colors.blue),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      contactList.removeAt(index);
                    });
                    Navigator.of(context).pop();
                    showSnackBar('Contact has been deleted from the list.', context);
                  },
                  icon: Icon(Icons.delete_outlined, color: Colors.blue),
                ),
              ],
            ),
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        toolbarHeight: 70,
        elevation: 10,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        backgroundColor: Colors.blueGrey,
        shadowColor: Colors.black12,
        // surfaceTintColor: Colors.black12,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey, width: 1)
                    ),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                  controller: numberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(13),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Number',
                    labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey, width: 1)
                    ),
                  )
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {addContact();},
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.blueGrey,
                      minimumSize: Size(double.infinity, 40),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      )
                  ),
                  child: Text('Add', style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),),
                )
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 50, 10, 30),
              // padding: ,
              child: ListView.builder(
                shrinkWrap: true,  // Allow ListView to fit inside the scrollable column
                physics: NeverScrollableScrollPhysics(),
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  var contact = contactList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: GestureDetector(
                      onLongPress: () {deleteContactWithAlert(context, index);},
                      child: ListTile(
                        tileColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        ),
                        leading: Icon(Icons.person, color: Colors.pink[900], size: 30),
                        trailing: Icon(Icons.phone, color: Colors.blue, size: 30),
                        title: Text(contact['name']!, style: TextStyle(
                            fontSize: 18,
                            color: Colors.pink[300],
                            fontWeight: FontWeight.bold
                        ),),
                        subtitle: Text(contact['number']!, style: TextStyle(
                          fontSize: 13,
                          color: Colors.pink[700],
                        ),),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}