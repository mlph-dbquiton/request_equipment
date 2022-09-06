import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class EquipmentForm extends StatefulWidget {
  const EquipmentForm({Key? key}) : super(key: key);



  @override
  State<EquipmentForm> createState() => _EquipmentFormState();
}

class _EquipmentFormState extends State<EquipmentForm> {
  final _formKey = GlobalKey<FormState>();


  String specs=' ', description = ' ', code = ' ', status = ' ';
  @override
  Widget build(BuildContext context) {
    final CollectionReference equipment =
        FirebaseFirestore.instance.collection('equipment');

    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Item specs';
                }
                return null;
              }, 
              onChanged: (value) {
                specs = value;
              },
              decoration: InputDecoration(
                icon: const Icon(Icons.add_box_rounded),
                alignLabelWithHint: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black87, width: 2
                  ),
                  borderRadius: BorderRadius.circular(8)
                ),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.red, width: 2
                    ),
                    borderRadius: BorderRadius.circular(8)
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Colors.red, width: 2
                    ),
                    borderRadius: BorderRadius.circular(8)
                ),
                errorStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 12, color: Colors.red),
                labelText: 'Name *',
                hintText: 'Name ',
                contentPadding: const EdgeInsets.all(18)
              ),
            ),
            const SizedBox(height: 12,),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Description';
                }
                return null;
              },
              onChanged: (value) {
                description = value;
              },
              decoration: InputDecoration(
                  icon: const Icon(Icons.add_box_rounded),
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black87, width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.red, width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.red, width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  errorStyle: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 12, color: Colors.red),
                  labelText: 'Description *',
                  hintText: 'Description ',
                  contentPadding: const EdgeInsets.all(18)
              ),
            ),
            const SizedBox(height: 12,),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Code';
                }
                return null;
              },
              onChanged: (value) {
                code = value;
              },
              decoration: InputDecoration(
                  icon: const Icon(Icons.add_box_rounded),
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black87, width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.red, width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.red, width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  errorStyle: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 12, color: Colors.red),
                  labelText: 'Code *',
                  hintText: 'Code ',
                  contentPadding: const EdgeInsets.all(18)
              ),
            ),
            const SizedBox(height: 12,),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter status';
                }
                return null;
              },
              onChanged: (value) {
                status = value;
              },
              decoration: InputDecoration(
                  icon: const Icon(Icons.add_box_rounded),
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black87, width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.red, width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.red, width: 2
                      ),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  errorStyle: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontSize: 12, color: Colors.red),
                  labelText: 'Status *',
                  hintText: 'Status ',
                  contentPadding: const EdgeInsets.all(18)
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data...')),
                      );

                      equipment
                          .add({'specs': specs, 'description': description , 'code': code, 'status': status})
                          .then(
                              (value) => ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Equipment Added!')),
                              ))
                                .catchError((error) =>
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Failed to Add Equipment: $error')),
                              )
                        );
                    }
                  },
                  child: const Text('Submit'),
                ),
            )
          ],
        )
    );
  }
}
