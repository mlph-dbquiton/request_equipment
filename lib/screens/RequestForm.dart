import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RequestForm extends StatefulWidget {
  const RequestForm({Key? key, required this.item}) : super(key: key);

  final DocumentSnapshot item;

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {

  final _formKey = GlobalKey<FormState>();

  String specs=' ',
         code = ' ',
         fullName = ' ',
         division = ' ',
         purpose = ' ';
  bool isAvailable = false;

  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final CollectionReference requests =
    FirebaseFirestore.instance.collection('formDetails');

    final CollectionReference equipments =
    FirebaseFirestore.instance.collection('equipment');

    return Scaffold(
      appBar: AppBar(
          title: const Text('Request Form'),
          backgroundColor: Colors.yellow
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Text('Requesting For: ',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                Text('${widget.item['specs']}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                Text('Code: ${widget.item['code']}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 20,),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Full Name!';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            fullName = value;
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
                              labelText: 'Employee Name *',
                              hintText: 'Employee Name ',
                              contentPadding: const EdgeInsets.all(18)
                          ),
                        ),
                        const SizedBox(height: 12,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Division';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            division = value;
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
                              labelText: 'Division *',
                              hintText: 'Division ',
                              contentPadding: const EdgeInsets.all(18)
                          ),
                        ),
                        const SizedBox(height: 12,),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Purpose for Requesting Item';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            purpose = value;
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
                              labelText: 'Purpose *',
                              hintText: 'Purpose ',
                              contentPadding: const EdgeInsets.all(18)
                          ),
                        ),
                        const SizedBox(height: 12,),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Select Schedule of Return: ',
                                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                              Text('${date.year} - ${date.month} - ${date.day}',
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(height: 16,),
                              ElevatedButton(
                                  child: const Text('Select Date'),
                                  onPressed: () async {
                                    DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: date,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2200),
                                    );

                                    if (newDate == null) return;

                                    setState(() => date = newDate);
                                  },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data...')),
                                  );

                                  await equipments
                                      .doc(widget.item.id)
                                      .update({
                                        'isAvailable': false
                                    });


                                  requests
                                      .add({'fullName': fullName,
                                            'division': division ,
                                            'purpose': purpose,
                                            'schedule': date,
                                            'specs' : widget.item['specs'],
                                            'code': widget.item['code'],
                                            'isAvailable': isAvailable
                                      })
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
                          ),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
