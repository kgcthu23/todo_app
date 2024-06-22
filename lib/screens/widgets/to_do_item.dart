import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/constraints/colors.dart';
import 'package:todo_app/models/todo.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem(
      {super.key,
      required this.todoItem,
      required this.onTodoChanged,
      required this.onTodoDelete});

  final Todo todoItem;
  final Function onTodoChanged;
  final Function onTodoDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          onTodoChanged(todoItem);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todoItem.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: tdRed, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
              color: Colors.white,
              iconSize: 20,
              onPressed: () {
                onTodoDelete(todoItem);
                print(Todo.toDoList());
              },
              icon: const Icon(Icons.delete)),
        ),
        title: Text(
          todoItem.todoText!,
          style: TextStyle(
              fontSize: 16,
              decoration: todoItem.isDone
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              color: tdBlack),
        ),
      ),
    );
  }
}
