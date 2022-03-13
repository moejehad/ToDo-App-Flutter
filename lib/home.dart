import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/db_helper.dart';
import 'package:flutter_course/task_widget.dart';

import 'constants.dart';
import 'new_task.dart';

class Home extends StatefulWidget {
  Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return NewTask();
                },
              ));
            }),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Mohammed Jehad'),
                accountEmail: Text('moejehad@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: Text('Mohammed Jehad'[0].toUpperCase()),
                ),
              ),
              ListTile(
                onTap: () {
                  tabController.animateTo(0);
                  Navigator.pop(context);
                },
                title: Text('Profile'),
                subtitle: Text('User Profile'),
                leading: Icon(Icons.person),
              ),
              ListTile(
                onTap: () {
                  tabController.animateTo(1);
                  Navigator.pop(context);
                },
                title: Text('Settings'),
                subtitle: Text('User Profile'),
                leading: Icon(Icons.settings),
              ),
              ListTile(
                onTap: () {
                  tabController.animateTo(2);
                  Navigator.pop(context);
                },
                title: Text('About'),
                subtitle: Text('User Profile'),
                leading: Icon(Icons.info),
              ),
              ListTile(
                onTap: () {
                  tabController.animateTo(3);
                  Navigator.pop(context);
                },
                title: Text('Log out'),
                subtitle: Text('User Profile'),
                leading: Icon(Icons.subdirectory_arrow_left),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Todo"),
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: 'All Tasks',
              ),
              Tab(
                text: 'Complete Tasks',
              ),
              Tab(
                text: 'InComplete Tasks',
              )
            ],
            isScrollable: true,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: [AllTasks(), CompTasks(), FinishedTasks()]),
            ),
          ],
        ));
  }
}

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SingleChildScrollView(
          child:
              Column(children: tasksList.map((e) => TaskWidget(e)).toList())),
    );
  }
}

class CompTasks extends StatefulWidget {
  @override
  _CompTasksState createState() => _CompTasksState();
}

class _CompTasksState extends State<CompTasks> {
  myFun() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
          children: tasksList
              .where((element) => element.isComplete == true)
              .map((e) => TaskWidget(e, myFun))
              .toList()),
    );
  }
}

class FinishedTasks extends StatefulWidget {
  @override
  _FinishedTasksState createState() => _FinishedTasksState();
}

class _FinishedTasksState extends State<FinishedTasks> {
  myFun() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
          children: tasksList
              .where((element) => element.isComplete == false)
              .map((e) => TaskWidget(e, myFun))
              .toList()),
    );
  }
}
