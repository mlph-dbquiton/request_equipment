import 'package:flutter/material.dart';
import 'package:request_equipment/screens/EquipmentDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AssignedList extends StatelessWidget {
  AssignedList({Key? key}) : super(key: key);

  final bool isAvailable = false;
  
  final CollectionReference _equipments =
      FirebaseFirestore.instance.collection('equipment');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Assigned Equipments'),
        backgroundColor: Colors.yellow,
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _equipments.where('isAvailable', isEqualTo: isAvailable ).snapshots(),
                    builder:  (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something Went Wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text('Loading Please Wait...');
                      }
                      final data = snapshot.requireData;

                      return ListView.separated(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: data.size,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (_, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Card(
                                    child: ListTile(
                                        title: Text('${data.docs[index]['specs']}'),
                                        leading: Image.network('${data.docs[index]['image']}'),
                                        subtitle: Text('${data.docs[index]['description']}'),
                                        trailing: Text('${data.docs[index]['code']}'),
                                        isThreeLine: true,
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(builder: (context) =>
                                                  EquipmentDetails(item: data.docs[index], isAvailable: false,)));
                                        },
                                    ),
                                  )
                              ],
                            );
                          },
                      );
                    },
                  ),
                ),
          ),
        )
    );
  }
}
