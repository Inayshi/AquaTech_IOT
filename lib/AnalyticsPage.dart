import 'package:aquatech/drawer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AnalyticsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> deleteRecord(BuildContext context, String documentId) async {
    await _firestore.collection('sensor_data').doc(documentId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Record deleted!')),
    );
  }

  Future<void> confirmDelete(BuildContext context, String documentId) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap a button to close the dialog
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Delete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete this record?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                deleteRecord(context, documentId);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MenuDrawer(),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF0081C9),
            height: MediaQuery.of(context).size.height * 0.2,
            child: const Center(
              child: Text(
                'Records',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('sensor_data').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                List<DataRow> rows = [];
                for (var doc in snapshot.data!.docs) {
                  var data = doc.data() as Map<String, dynamic>;
                  rows.add(
                    DataRow(cells: [
                      DataCell(Text(data['timestamp'].toDate().toString())),
                      DataCell(Text(data['WATER_TEMP'].toString())),
                      DataCell(Text(data['PH_LEVEL'].toString())),
                      DataCell(Text(data['AMMONIA'].toString())),
                      DataCell(
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => confirmDelete(context, doc.id),
                        ),
                      ),
                    ]),
                  );
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Timestamp')),
                        DataColumn(label: Text('Temperature ( °C)')),
                        DataColumn(label: Text('pH Level')),
                        DataColumn(label: Text('Ammonia (ppm)')),
                        DataColumn(label: Text('Water Change')),
                      ],
                      rows: rows,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
