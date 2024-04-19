import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petshop/Ui/new_pet_screen_ui/info_screen.dart';

class NewPet extends StatefulWidget {
  @override
  _NewPetState createState() => _NewPetState();
}

class _NewPetState extends State<NewPet> {
  List<String> animalBreeds = ['Dog', 'Cat', 'Bird', 'Other'];

  TextEditingController _petimagecontroller = TextEditingController();
  TextEditingController _petnamecontroller = TextEditingController();
  TextEditingController _pettypecontroller = TextEditingController();
  TextEditingController _petbreedcontroller = TextEditingController();
  TextEditingController _petdobcontroller = TextEditingController();
  TextEditingController _petgendercontroller = TextEditingController();
  TextEditingController _petweightcontroller = TextEditingController();
  TextEditingController _petdescriptioncontroller = TextEditingController();
  late DateTime _selectedDate = DateTime.now();
  String? _selectedBreed;
  String? _selectedGender;
  late final String savedDate;

  Future<void> _getImageFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _petimagecontroller.text = pickedFile.path;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image picked: ${pickedFile.path}'),
        ),
      );
    } else {
      print('No image picked');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        _petdobcontroller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
  }

  Future<void> _showBreedDropdown(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Breed"),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: animalBreeds.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(animalBreeds[index]),
                  onTap: () {
                    setState(() {
                      _selectedBreed = animalBreeds[index];
                      _pettypecontroller.text = _selectedBreed!;
                    });
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _passdata(BuildContext context) async {
    String petImage = _petimagecontroller.text;
    String petName = _petnamecontroller.text;
    String petType = _pettypecontroller.text;
    String petBreed = _petbreedcontroller.text;
    String petDob = _petdobcontroller.text;
    String petGender = _petgendercontroller.text;
    String petWeight = _petweightcontroller.text;
    String petDescription = _petdescriptioncontroller.text;

    print("this is work");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => infoscreen(
          petImage: petImage,
          petName: petName,
          petType: petType,
          petBreed: petBreed,
          petDob: petDob,
          petGender: petGender,
          petWeight: petWeight,
          petDescription: petDescription,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _petimagecontroller.dispose();
    _petnamecontroller.dispose();
    _petbreedcontroller.dispose();
    _petdobcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('New Pet'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: () {
                _getImageFromGallery(context);
              },
              child: Container(
                width: media.width * 0.1,
                height: media.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.black26,
                ),
                child: _petimagecontroller.text.isNotEmpty
                    ? Image.file(
                        File(_petimagecontroller.text),
                        fit: BoxFit.cover,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 30.0,
                            color: Colors.red,
                          ),
                          SizedBox(height: 10.0),
                          Text('ADD PHOTO'),
                        ],
                      ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Pet Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _petnamecontroller,
              decoration: InputDecoration(
                labelText: "Your Pet Name",
                filled: true,
                fillColor: Colors.grey.shade700,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Type of Pet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _pettypecontroller,
              onTap: () {
                _showBreedDropdown(context);
              },
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Select Type",
                filled: true,
                fillColor: Colors.grey.shade700,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Breed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _petbreedcontroller,
              decoration: InputDecoration(
                labelText: "Enter Breed",
                filled: true,
                fillColor: Colors.grey.shade700,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Date of Birth',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _petdobcontroller,
              onTap: () async {
                await _selectDate(context);
                if (_selectedDate != null) {
                  _petdobcontroller.text =
                      "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}";
                }
              },
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Select Date of Birth",
                filled: true,
                fillColor: Colors.grey.shade700,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Gender',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedGender = 'Male';
                      _petgendercontroller.text = _selectedGender!;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Male',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    height: media.height * 0.08,
                    width: media.width * 0.4,
                    decoration: BoxDecoration(
                      color: _selectedGender == 'Male'
                          ? Colors.red.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedGender = 'Female';
                      _petgendercontroller.text = _selectedGender!;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('Female',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                    height: media.height * 0.08,
                    width: media.width * 0.4,
                    decoration: BoxDecoration(
                      color: _selectedGender == 'Female'
                          ? Colors.red.shade700
                          : Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              'Weight',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _petweightcontroller,
              decoration: InputDecoration(
                labelText: "Enter Weight",
                filled: true,
                fillColor: Colors.grey.shade700,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: _petdescriptioncontroller,
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter description here...',
                filled: true,
                fillColor: Colors.grey.shade700,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
              ),
              onPressed: () {
                _passdata(context);
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
