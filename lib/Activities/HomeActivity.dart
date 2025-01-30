import 'package:flutter/material.dart';
import '../Assets/CustomColors.dart';

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});
  
  mySnackBar(message, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  myAlertDialog(message, context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Icon(Icons.warning_amber_rounded, color: CustomColors.ochre, size: 60),
            content: Text(message),
            actions: [
              ElevatedButton(
                onPressed: () {
                  mySnackBar(message, context);
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )
                ),
                child: Text('Ok'),
              ),
            ],
          ),
        );
      }
    );
  }
  
  @override
  Widget build(BuildContext context) {
    const String title = 'Flutter Practice';
    const String name = 'Sadrul Hossain';
    const String email = 'hossainsadrul@gmail.com';
    const String image = 'https://avatars.githubusercontent.com/u/37948211?v=4';

    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: TextStyle(
              fontSize: 25,
              color: Colors.white
          )),
          // centerTitle: true,
          titleSpacing: 0,
          toolbarHeight: 60,
          toolbarOpacity: 1,
          elevation: 20,
          backgroundColor: CustomColors.ochre,
          leading: Builder(builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white,),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          )),
          actions: [
            IconButton(onPressed: () {mySnackBar("You have new Comments", context);}, icon: Icon(Icons.message, color: Colors.white,)),
            IconButton(onPressed: () {mySnackBar("You have new mails", context);}, icon: Icon(Icons.email, color: Colors.white,)),
            IconButton(onPressed: () {mySnackBar("You have new mails", context);}, icon: Icon(Icons.more_vert, color: Colors.white,)),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.home, color: Colors.white),
                text: 'Home',

              ),
              Tab(
                icon: Icon(Icons.search, color: Colors.white),
                text: 'Search',
              ),
              Tab(
                icon: Icon(Icons.email, color: Colors.white),
                text: 'Email',
              ),
              Tab(
                icon: Icon(Icons.settings, color: Colors.white),
                text: 'Settings',
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.white),
                text: 'Profile',
              ),
              Tab(
                icon: Icon(Icons.access_alarm, color: Colors.white),
                text: 'Alarm',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {mySnackBar('Floating action button clicked.', context);},
          elevation: 30,
          backgroundColor: CustomColors.ochre,
          shape: CircleBorder(),
          child: Icon(Icons.add, color: Colors.white,),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          backgroundColor: CustomColors.ochre,
          elevation: 30,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contact'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: CustomColors.ochre),
                  accountName: Text(name),
                  accountEmail: Text(email),
                  currentAccountPicture: Image.network(image),
                ),
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
              ),
              ListTile(
                title: Text('Contact'),
                leading: Icon(Icons.phone),
              ),
              ListTile(
                title: Text('Profile'),
                leading: Icon(Icons.person),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [

          ],
        ),
      ),
    );
  }
}