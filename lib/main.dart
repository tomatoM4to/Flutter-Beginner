import 'package:flutter/material.dart';

void main() {
  	runApp(const App());
}

class App extends StatelessWidget {
  	const App({super.key});
  	@override
  	Widget build(BuildContext context) {
    	return MaterialApp(
	  		home: Scaffold(
				appBar: AppBar(
					backgroundColor: Colors.red,
					centerTitle: false,
					title: const Text('Flutter Demo'),
				),
				body: const Center(
					child: Text('Hello World'),
				),
			),
		);
  	}
}