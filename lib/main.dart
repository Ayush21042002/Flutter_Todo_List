import 'package:flutter/material.dart';
import 'package:todo_list/widgets/add_todo.dart';
import 'package:todo_list/widgets/todo_tile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        accentColor: Color(0xfffce38a),
      ),
      home: MyTodoList(title: 'To-do List'),
    );
  }
}

class MyTodoList extends StatefulWidget {
  MyTodoList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyTodoListState createState() => _MyTodoListState();
}

class _MyTodoListState extends State<MyTodoList> {
  List<Todo> _data = [
    Todo('1', "Buy groceries", DateTime.now(), TimeOfDay.now()),
    Todo('2'.toString(), "Buy groceries", DateTime.now(), TimeOfDay.now()),
    Todo('3', "Buy groceries", DateTime.now(), TimeOfDay.now()),
    Todo('4', "Buy groceries", DateTime.now(), TimeOfDay.now()),
  ];

  void _deleteTodo(String id) {
    _data.removeWhere((element) => element.id == id);
    setState(() {
      _data = _data;
    });
  }

  void _addTodo(String title, String id, DateTime date, TimeOfDay time) {
    setState(() {
      _data.add(Todo(id, title, date, time));
    });
  }

  void _showAddTodo(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: AddTodo(_addTodo),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xff222831),
        actions: [
          IconButton(
            onPressed: () => _showAddTodo(context),
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, idx) => TodoTile(
                title: _data[idx].title,
                date: _data[idx].date,
                time: _data[idx].time,
                id: _data[idx].id,
                deleteTodo: _deleteTodo,
              ),
              itemCount: _data.length,
            ),
          ),
        ],
      ),
    );
  }
}

class Todo {
  final String _title;
  final DateTime _due;
  final TimeOfDay _time;
  final String id;

  Todo(
    this.id,
    this._title,
    this._due,
    this._time,
  );

  String get title {
    return this._title;
  }

  String get date {
    String str = "";
    if (this._due.day < 10) {
      str += '0${this._due.day}';
    } else {
      str += '${this._due.day}';
    }

    if (this._due.month < 10) {
      str += '-0${this._due.month}';
    } else {
      str += '-${this._due.month}';
    }

    return '$str-${this._due.year}';
  }

  String get time {
    return '${this._time.hour}:${this._time.minute}';
  }
}
