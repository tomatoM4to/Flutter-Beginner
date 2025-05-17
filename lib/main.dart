import 'package:flutter/material.dart';

void main() {
  runApp(const Root());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 70),
          Title(),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: CustomInput(),
          ),
          SizedBox(height: 50),
          TodoList(),
        ],
      ),
    );
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context) {
    const borderColor = Color(0xFF7CFFD6); // 민트 계열

    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter a task',
              labelStyle: TextStyle(color: borderColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: borderColor),
                gapPadding: 0,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: borderColor, width: 2),
                gapPadding: 0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: borderColor),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Container(
          height: 48,
          width: 48,
          margin: const EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1),
            color: borderColor,
          ),
          child: IconButton(
            onPressed: () {
              // Add your action here
            },
            icon: const Icon(Icons.add, color: Color(0xFF1E1E1E)),
            splashRadius: 24,
            tooltip: 'Add',
          ),
        ),
      ],
    );
  }
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(child: App()),
        backgroundColor: const Color(0xFF1E1E1E),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Todo List',
      style: TextStyle(
        fontSize: 40,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final String text;
  final VoidCallback? onDelete;
  const TodoItem({super.key, required this.text, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 30),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.08)),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.redAccent),
            onPressed: onDelete ?? () {},
            tooltip: 'Delete',
          ),
        ],
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  static const todos = ['Todo 1', 'Todo 2', 'Todo 3', 'Todo 4', 'Todo 5'];
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return TodoItem(text: todos[index]);
        },
      ),
    );
  }
}
