class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<Todo> toDoList() {
    return [
      Todo(id: '01', todoText: 'Jogging', isDone: true),
      Todo(id: '02', todoText: 'Chest press', isDone: true),
      Todo(id: '03', todoText: 'Deadlifts'),
      Todo(id: '04', todoText: 'Bent Over Rows'),
      Todo(id: '05', todoText: 'Split Squats'),
      Todo(id: '06', todoText: 'Bicep Curls'),
      Todo(id: '07', todoText: 'Tricep Extensions'),
    ];
  }
}
