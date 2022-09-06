import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:request_equipment/SampleForm.dart';


class MyHomepage extends StatelessWidget {
  MyHomepage({Key? key}) : super(key: key);
  final Stream<QuerySnapshot> equipment =
    FirebaseFirestore.instance.collection('equipment').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Data From Firestore"),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                const Text(
                  'Retrive Data from the Cloud FireStore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                Container(
                  height: 350,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: equipment,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went Mali');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Loading pa wait lang...');
                      }
                      final data = snapshot.requireData;
                      return ListView.builder(
                        itemCount: data.size,
                          itemBuilder: (_, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${index + 1}. ${data.docs[index]['specs']}',
                                style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700
                                ),
                              ),
                              Text(
                                '${data.docs[index]['description']}',
                                style: const TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w300
                                ),
                              ),
                              Text(
                                '${data.docs[index]['code']}',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500
                                ),
                              ),
                              Text(
                                '${data.docs[index]['status']}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600
                                ),
                              ),

                            ],
                          );
                          }
                      );
                    },
                  ) ,
                ),
                const Divider(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Create Data to the Cloud Firestore',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
                const EquipmentForm(),
              ],
            ),
        ),
      ),
    );
  }
}
