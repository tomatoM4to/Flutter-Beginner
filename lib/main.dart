import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Home()));
  }
}

class CustomInput extends StatelessWidget {
  const CustomInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: '할일을 입력하세요',
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xB3F58529),
                    Color(0xB3DD2A7B),
                    Color(0xB38134AF),
                    Color(0xB3515BD4),
                  ],
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.add, color: Colors.white, size: 30),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xB3F58529),
            Color(0xB3DD2A7B),
            Color(0xB38134AF),
            Color(0xB3515BD4),
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 50),
          Title(),
          SizedBox(height: 20),
          CustomInput(),
          SizedBox(height: 10),
          Expanded(child: TodoList()),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'TODO List',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
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
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete ?? () {},
          ),
        ],
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    // 예시 데이터
    final todos = [
      '할일 1',
      '할일 2',
      '할일 3',
      '할일 4',
      '할일 5',
      '할일 6',
      '할일 1',
      '할일 2',
      '할일 3',
      '할일 4',
      '할일 5',
      '할일 6',
    ];

    return Container(
      margin: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.8),
                width: 2,
              ),
            ),
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoItem(text: todos[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
