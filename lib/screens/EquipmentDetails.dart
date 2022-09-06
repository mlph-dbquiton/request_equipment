import 'package:flutter/material.dart';
import 'package:request_equipment/screens/RequestForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EquipmentDetails extends StatelessWidget {
  const EquipmentDetails({Key? key, required this.item, required this.isAvailable}) : super(key: key);

  final DocumentSnapshot item;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 280,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize (
                    size: const Size.fromRadius(48),
                    child: Image.network('${item['image']}', fit: BoxFit.fill,)
                    ),
                  ),
              ),
              SizedBox(
                height: 50,
                child: Center (
                  child: Text('${item['specs']}',
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Center (
                  child: Text('Item Code: ${item['code']}',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              SizedBox(
                height: 50,
                child: Center (
                  child: Text('${item['description']}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                  ),
                ),
              ),

              SizedBox(
                height: 55,
                child: ButtonTheme (
                    minWidth: 200.0,
                    height: 100.0,
                  child: isAvailable ?
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                RequestForm(item: item)
                            )
                        );
                      },
                      child: const Text('Request', style: TextStyle(fontSize: 20)),
                  )
                      : const Center(child: Text('Item is not Available!', style: TextStyle(fontSize: 30),))
                ),
              ),
            ],
              )
            )
          ),
        );



  }
}
