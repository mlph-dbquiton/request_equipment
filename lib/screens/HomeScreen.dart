import 'package:flutter/material.dart';
import 'package:request_equipment/screens/AssignedList.dart';
import 'package:request_equipment/screens/AvailableList.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('MonstarLab Digi-Inventory'),
          backgroundColor: Colors.yellow,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 120,
                    child: Card(
                      color: Colors.yellow[200],
                      child: Center(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                          title: const Text('Available Equipments',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600
                              )
                          ),
                          leading: const Icon(Icons.assignment_turned_in_rounded , size: 35, color: Colors.black,),
                          subtitle: const Text('View list of Available Equipments for Request',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400
                              )
                          ),
                          trailing: const Icon(Icons.double_arrow_rounded, size: 35, color: Colors.black,),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    AvailableList()
                            )
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    height: 120,
                    child: Card(
                      color: Colors.yellow[200],
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        title: const Text('Assigned Equipments',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600
                            )
                        ),
                        leading: const Icon(Icons.assignment_ind_rounded, size: 35, color: Colors.black, ),
                        subtitle: const Text('View list of Already Assigned Equipments',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400
                            )
                        ),
                        trailing: const Icon(Icons.double_arrow_rounded, size: 35, color: Colors.black,),
                        isThreeLine: true,
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                 AssignedList()
                              ));
                        },
                      ),
                    ),
                  ),

                ],
              )
              ),
            ),
        ),



        );
  }
}
