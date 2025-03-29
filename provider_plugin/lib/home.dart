import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_plugin/provider.dart';
import 'provider.dart';
import 'second.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          // Using Consumer to listen for changes and rebuild ONLY this widget
          Consumer<NumberProvider>(
            builder: (context, numberProvider, child) {
              return Text(
                'Current Number: ${numberProvider.numbers.last}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            },
          ),

          Expanded(
            child: Consumer<NumberProvider>(
              builder: (context, numberProvider, child) {
                return ListView.builder(
                  itemCount: numberProvider.numbers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(numberProvider.numbers[index].toString(),
                          style: TextStyle(fontSize: 20)),
                    );
                  },
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              );
            },
            child: Text('Go to Second'),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Using Provider.of with listen: false (because we just call a method, no rebuild needed)
          Provider.of<NumberProvider>(context, listen: false).addNumber();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}