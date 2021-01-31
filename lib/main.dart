import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ToDo {
  final String title;
  final String description;

  ToDo(this.title, this.description);
}

void main() {
  runApp(MaterialApp(
    title: ("Passing Data"),
    home: ToDoScreen(
      todos: List.generate(
        20,
        (i) => ToDo('Todo $i', 'A description of what needs to be done $i'),
      ),
    ),
  ));
}

class ToDoScreen extends StatelessWidget {
  final List<ToDo> todos;
  ToDoScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo List"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(todo: todos[index]),
                  ));
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final ToDo todo;

  DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}
