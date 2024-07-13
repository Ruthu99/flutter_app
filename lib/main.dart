import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
            ),
          ),
          title: Center(
            child: Text('Donor Form'),
          ),
          actions: [Container(width: 56)], // Placeholder for centering title
        ),
        body: DonorForm(),
      ),
    );
  }
}

class DonorForm extends StatefulWidget {
  @override
  _DonorFormState createState() => _DonorFormState();
}

class _DonorFormState extends State<DonorForm> {
  final _formKey = GlobalKey<FormState>();
  String? platelets;
  String? medicalCondition;
  String? closeToNeedy;
  String? donorGender;
  String? donorBloodGroup;
  XFile? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Email ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Name of the donor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name of the donor';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'USN'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the USN';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Donor Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the donor age';
                  }
                  return null;
                },
              ),
              const Text('Donor Gender *'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile(
                    title: const Text(
                      'Male',
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: 'male',
                    groupValue: donorGender,
                    onChanged: (value) {
                      setState(() {
                        donorGender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'Female',
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: 'female',
                    groupValue: donorGender,
                    onChanged: (value) {
                      setState(() {
                        donorGender = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text(
                      'Non binary',
                      style: TextStyle(fontSize: 15),
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: 'nonbinary',
                    groupValue: donorGender,
                    onChanged: (value) {
                      setState(() {
                        donorGender = value.toString();
                      });
                    },
                  ),
                ],
              ),
              const Text('Donor Blood Group *'),
              Column(
                children: [
                  RadioListTile(
                    title: const Text('A RhD positive (A+)'),
                    value: 'A+',
                    groupValue: donorBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        donorBloodGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('A RhD negative (A-)'),
                    value: 'A-',
                    groupValue: donorBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        donorBloodGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('B RhD positive (B+)'),
                    value: 'B+',
                    groupValue: donorBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        donorBloodGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('B RhD negative (B-)'),
                    value: 'B-',
                    groupValue: donorBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        donorBloodGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('O RhD positive (O+)'),
                    value: 'O+',
                    groupValue: donorBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        donorBloodGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('O RhD negative (O-)'),
                    value: 'O-',
                    groupValue: donorBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        donorBloodGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('AB RhD positive (AB+)'),
                    value: 'AB+',
                    groupValue: donorBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        donorBloodGroup = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('AB RhD negative (AB-)'),
                    value: 'AB-',
                    groupValue: donorBloodGroup,
                    onChanged: (value) {
                      setState(() {
                        donorBloodGroup = value.toString();
                      });
                    },
                  ),
                ],
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Donor Mobile number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an additional mobile number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Donor Additional mobile number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an additional mobile number';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Address Pin code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the address pin code';
                  }
                  return null;
                },
              ),
              const Text('Have you donated platelets?'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Yes'),
                      value: 'yes',
                      groupValue: platelets,
                      onChanged: (value) {
                        setState(() {
                          platelets = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text('No'),
                      value: 'no',
                      groupValue: platelets,
                      onChanged: (value) {
                        setState(() {
                          platelets = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Number of donations'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of donations';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Last date of donation'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the last date of donation';
                  }
                  return null;
                },
                keyboardType: TextInputType.datetime,
              ),
              const Text('Are you under any medical condition?'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Yes'),
                      value: 'yes',
                      groupValue: medicalCondition,
                      onChanged: (value) {
                        setState(() {
                          medicalCondition = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text('No'),
                      value: 'no',
                      groupValue: medicalCondition,
                      onChanged: (value) {
                        setState(() {
                          medicalCondition = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              const Text('Will you donate blood if you stay close to needy?'),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text('Yes'),
                      value: 'yes',
                      groupValue: closeToNeedy,
                      onChanged: (value) {
                        setState(() {
                          closeToNeedy = value.toString();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text('No'),
                      value: 'no',
                      groupValue: closeToNeedy,
                      onChanged: (value) {
                        setState(() {
                          closeToNeedy = value.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                    labelText:
                        'Write a few lines about your blood donation experience'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please write about your blood donation experience';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Upload Image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              _image == null
                  ? Text('No image selected.')
                  : Image.file(File(_image!.path)),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Process data
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
