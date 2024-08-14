import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:note_book_api/screens/add_page.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  @override
  void initState(
    {
      super.initState();
      
      fetchTodo();
    }
  );
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Todo List')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddPage,
        child: Text('Add Todo'),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(),
    );
    Navigator.push(context, route);
  }

  Future<Void> fetchTodo() async {
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    print(response.statusCode);
    print(response.body);
  }
}
