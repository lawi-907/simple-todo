import 'dart:math';

import 'package:firstapp/utils/todo_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();
  List ToDoList = [
    ["Learn Web Development", false],
    ["Drink Tea", false],
        
  ];

  void checkBoxChanged(int index) {
    setState(() {
      ToDoList[index][1] = !ToDoList[index][1];
    });

  }

  void saveNewTask() {
    setState(() {
      ToDoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      ToDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade200,
      appBar: AppBar(title: const Text(
        'Simple Todo'
      ),
      backgroundColor: const Color.fromARGB(255, 12, 39, 85),
      foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: ToDoList.length ,
      itemBuilder: (BuildContext context, index) {
        return TodoList(
          taskname: ToDoList[index][0],
          taskCompleted: ToDoList[index][1],
          onChanged: (value) => checkBoxChanged(index),
          deleteFunction: (context) => deleteTask(index),
        );

      }
    ),
    floatingActionButton: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextField(
              controller: _controller ,
              decoration: InputDecoration(
                hintText: 'Add New Todo Items',
                filled: true,
                fillColor: Colors.blue.shade200,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.blueAccent,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ) 
              ),
            ),
          )
          ),
          FloatingActionButton(
            onPressed: saveNewTask,
            child: const Icon(Icons.add),
            
          
          ),
        ],
      ),
    ),
    );
  }
}