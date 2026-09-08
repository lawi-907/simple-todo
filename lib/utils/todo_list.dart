import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList( {
    super.key,
    required this.taskname,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    });

  final String taskname;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 0,
          ),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: deleteFunction,
                icon:  Icons.delete,
                borderRadius: BorderRadius.circular(15),
                backgroundColor: Colors.red,
                  ),
              ],
                ),
              
              
            child: Container(            
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 9, 26, 54),
                borderRadius: BorderRadius.circular(15),
            
              ),            
              child: Row(
                children: [
                  Checkbox(value: taskCompleted, 
                  onChanged: onChanged,
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                  ),
                  ),
                  Text(
                    taskname,
                    style:  TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      decoration: taskCompleted 
                         ? TextDecoration.lineThrough 
                         : TextDecoration.none,
                      decorationColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}