import 'package:flutter/material.dart';
import 'package:todo_app/constraints/colors.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/widgets/search_box.dart';
import 'package:todo_app/screens/widgets/to_do_item.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final toDoList = Todo.toDoList();

  final _textEditingController = TextEditingController();

  void onTodoChanged(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void onTodoDelete(Todo todo) {
    setState(() {
      toDoList.remove(todo);
    });
  }

  void addToDoTask(String todoTask) {
    setState(() {
      toDoList.add(Todo(id: '${toDoList.length * 2}', todoText: todoTask));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(context, addToDoTask, _textEditingController),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            const SearchBox(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    child: const Text(
                      'All todos',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                  for (Todo todo in toDoList)
                    ToDoItem(
                      todoItem: todo,
                      onTodoChanged: onTodoChanged,
                      onTodoDelete: onTodoDelete,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context, Function addToDoTask,
    TextEditingController textEditingController) {
  return AppBar(
    backgroundColor: tdBGColor,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.menu,
          color: tdBlack,
          size: 30,
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Add a new task',
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        addToDoTask(textEditingController.text);
                        print('close dialog');
                        Navigator.of(context).pop();
                        textEditingController.clear();
                      },
                      child: const Text('Add'))
                ],
              ),
            );
          },
          icon: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ],
    ),
  );
}
