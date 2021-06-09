import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String id;
  final Function deleteTodo;
  const TodoTile({
    Key? key,
    required this.title,
    required this.date,
    required this.time,
    required this.id,
    required this.deleteTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(date),
                    SizedBox(
                      width: 10,
                    ),
                    Text(time),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                deleteTodo(id);
              },
              icon: Icon(
                Icons.delete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
