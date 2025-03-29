import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_plugin/provider.dart';
import 'provider.dart';
import 'home.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Using Consumer to listen for changes in numbers
          Consumer<NumberProvider>(
            builder: (context, numberProvider, child) {
              return Text(
                'Recent Number: ${numberProvider.numbers.last}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            },
          ),

          SizedBox(height: 20),

          SizedBox(
            height: 50,
            child: Consumer<NumberProvider>(
              builder: (context, numberProvider, child) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numberProvider.numbers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        numberProvider.numbers[index].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          SizedBox(height: 20),


        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<NumberProvider>(context, listen: false).addNumber();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}