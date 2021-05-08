import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/tasks/task.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddTaskScreen((newTaskTitle) {
                  setState(() {
                    tasks.add(Task(name: newTaskTitle));
                    Navigator.pop(context);
                  });
                }),
              ),
            ),
          );
          print('button pressed');
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 40.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.list,
                      color: Colors.lightBlueAccent,
                      size: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Todoey',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${tasks.length} Tasks',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 30.0,
                    right: 30.0,
                    top: 40.0,
                  ),
                  child: TasksList(tasks),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
