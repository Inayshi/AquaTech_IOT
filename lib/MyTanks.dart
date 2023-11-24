import 'package:aquatech/TankProfile.dart';
import 'package:aquatech/drawer.dart';
import 'package:flutter/material.dart';

class MyTanks extends StatelessWidget {
  const MyTanks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tanks'),
      ),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF0081C9), // Top part color
            height: MediaQuery.of(context).size.height *
                0.2, // 30% of screen height
            child: const Center(
              child: Text(
                'My Tanks',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 1, // Replace with the actual number of tanks
              separatorBuilder: (context, index) =>
                  const Divider(), // Add a separator between items
              itemBuilder: (context, index) {
                // Replace with tank data
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const TankProfile()),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      'Tank ${index + 1}',
                      style: const TextStyle(
                        fontSize: 30, // Set the desired font size
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTank(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNewTank(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String sensorId = '';
        String commandId = '';
        
        return AlertDialog(
          title: Text('Add New Tank'),
          contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Use the minimum height
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Sensor ID'),
                onChanged: (value) {
                  sensorId = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Command ID'),
                onChanged: (value) {
                  commandId = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform the action of adding a new tank with sensorId and commandId
                // You can add the logic here to handle the new tank creation
                // For now, print the values
                print('Sensor ID: $sensorId, Command ID: $commandId');
                // Close the dialog
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  
}
