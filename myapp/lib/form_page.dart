import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BiodataScreen(),
    );
  }
}

class BiodataScreen extends StatefulWidget {
  @override
  State<BiodataScreen> createState() => _BiodataScreenState();
}

class _BiodataScreenState extends State<BiodataScreen> {
  bool isSaving = false;

  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  final contactNumberController = TextEditingController();
  final emailAddressController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final placeOfBirthController = TextEditingController();
  final ageController = TextEditingController();
  final genderController = TextEditingController();
  final civilStatusController = TextEditingController();
  final citizenshipController = TextEditingController();
  final religionController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final fatherNameController = TextEditingController();
  final fatherOccupationController = TextEditingController();
  final motherNameController = TextEditingController();
  final motherOccupationController = TextEditingController();
  final numberOfSiblingsController = TextEditingController();

  final collegeSchoolController = TextEditingController();
  final courseController = TextEditingController();
  final collegeYearController = TextEditingController();

  final seniorHighSchoolController = TextEditingController();
  final strandController = TextEditingController();
  final seniorHighYearController = TextEditingController();

  final juniorHighSchoolController = TextEditingController();
  final juniorHighYearController = TextEditingController();

  final elementarySchoolController = TextEditingController();
  final elementaryYearController = TextEditingController();

  final companyController = TextEditingController();
  final positionController = TextEditingController();
  final durationController = TextEditingController();

  final trainingSeminarController = TextEditingController();
  final organizerController = TextEditingController();
  final trainingDateController = TextEditingController();

  final specialSkillsController = TextEditingController();

  final referenceNameController = TextEditingController();
  final referencePositionController = TextEditingController();
  final referenceContactController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    addressController.dispose();
    contactNumberController.dispose();
    emailAddressController.dispose();
    dateOfBirthController.dispose();
    placeOfBirthController.dispose();
    ageController.dispose();
    genderController.dispose();
    civilStatusController.dispose();
    citizenshipController.dispose();
    religionController.dispose();
    heightController.dispose();
    weightController.dispose();

    fatherNameController.dispose();
    fatherOccupationController.dispose();
    motherNameController.dispose();
    motherOccupationController.dispose();
    numberOfSiblingsController.dispose();

    collegeSchoolController.dispose();
    courseController.dispose();
    collegeYearController.dispose();

    seniorHighSchoolController.dispose();
    strandController.dispose();
    seniorHighYearController.dispose();

    juniorHighSchoolController.dispose();
    juniorHighYearController.dispose();

    elementarySchoolController.dispose();
    elementaryYearController.dispose();

    companyController.dispose();
    positionController.dispose();
    durationController.dispose();

    trainingSeminarController.dispose();
    organizerController.dispose();
    trainingDateController.dispose();

    specialSkillsController.dispose();

    referenceNameController.dispose();
    referencePositionController.dispose();
    referenceContactController.dispose();

    super.dispose();
  }

  Future<void> submitBiodata() async {
    final data = <String, String>{
            'Full Name': fullNameController.text,
            'Address': addressController.text,
            'Contact Number': contactNumberController.text,
            'Email Address': emailAddressController.text,
            'Date of Birth': dateOfBirthController.text,
            'Place of Birth': placeOfBirthController.text,
            'Age': ageController.text,
            'Gender': genderController.text,
            'Civil Status': civilStatusController.text,
            'Citizenship': citizenshipController.text,
            'Religion': religionController.text,
            'Height': heightController.text,
            'Weight': weightController.text,

            "Father's Name": fatherNameController.text,
            "Father's Occupation": fatherOccupationController.text,
            "Mother's Name": motherNameController.text,
            "Mother's Occupation": motherOccupationController.text,
            'Number of Siblings': numberOfSiblingsController.text,

            'College School': collegeSchoolController.text,
            'Course': courseController.text,
            'College Year': collegeYearController.text,

            'Senior High School': seniorHighSchoolController.text,
            'Strand': strandController.text,
            'Senior High Year Graduated': seniorHighYearController.text,

            'Junior High School': juniorHighSchoolController.text,
            'Junior High Year Graduated': juniorHighYearController.text,

            'Elementary School': elementarySchoolController.text,
            'Elementary Year Graduated': elementaryYearController.text,

            'Company': companyController.text,
            'Position': positionController.text,
            'Duration': durationController.text,

            'Training / Seminar': trainingSeminarController.text,
            'Organizer': organizerController.text,
            'Training Date': trainingDateController.text,

            'Special Skills': specialSkillsController.text,

            'Reference Name': referenceNameController.text,
            'Reference Position': referencePositionController.text,
            'Reference Contact Number': referenceContactController.text,
    };

    setState(() => isSaving = true);
    try {
      await FirebaseFirestore.instance.collection('biodata').add({
        ...data,
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (!mounted) return;
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BiodataOutputScreen(data: data),
        ),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not save biodata: $error')),
      );
    } finally {
      if (mounted) {
        setState(() => isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            width: MediaQuery.sizeOf(context).width < 500
                ? MediaQuery.sizeOf(context).width
                : 500,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  'BIODATA',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'PERSONAL INFORMATION',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: fullNameController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: addressController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: contactNumberController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: emailAddressController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: dateOfBirthController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: placeOfBirthController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Place of Birth',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: ageController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: genderController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: civilStatusController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Civil Status',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: citizenshipController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Citizenship',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: religionController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Religion',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: heightController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Height',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: weightController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'FAMILY BACKGROUND',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: fatherNameController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: "Father's Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: fatherOccupationController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: "Father's Occupation",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: motherNameController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: "Mother's Name",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: motherOccupationController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: "Mother's Occupation",
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: numberOfSiblingsController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Number of Siblings',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'EDUCATIONAL BACKGROUND',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  'College',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                TextField(
                  controller: collegeSchoolController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'College School',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: courseController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Course',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: collegeYearController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Year',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  'Senior High School',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                TextField(
                  controller: seniorHighSchoolController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Senior High School',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: strandController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Strand',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: seniorHighYearController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Year Graduated',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  'Junior High School',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                TextField(
                  controller: juniorHighSchoolController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Junior High School',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: juniorHighYearController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Year Graduated',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 15),

                Text(
                  'Elementary',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                TextField(
                  controller: elementarySchoolController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Elementary School',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: elementaryYearController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Year Graduated',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'WORK EXPERIENCE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: companyController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Company',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: positionController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Position',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: durationController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Duration',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'TRAININGS AND SEMINARS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: trainingSeminarController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Training / Seminar',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: organizerController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Organizer',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: trainingDateController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Date',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'SPECIAL SKILLS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: specialSkillsController,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Special Skills',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 30),

                Text(
                  'CHARACTER REFERENCES',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 15),

                TextField(
                  controller: referenceNameController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Reference Name',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: referencePositionController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Position',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 12),

                TextField(
                  controller: referenceContactController,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    border: OutlineInputBorder(),
                  ),
                ),

                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: isSaving ? null : submitBiodata,
                  child: Text(isSaving ? 'SAVING...' : 'SUBMIT'),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BiodataOutputScreen extends StatelessWidget {
  final Map<String, String> data;

  BiodataOutputScreen({required this.data});

  Widget buildSection(String title, List<MapEntry<String, String>> fields) {
    final filledFields =
        fields.where((field) => field.value.trim().isNotEmpty).toList();

    if (filledFields.isEmpty) {
      return SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 25),
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        ...filledFields.map(
          (field) => Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  field.key,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(field.value),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: 500,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'BIODATA',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                buildSection(
                  'PERSONAL INFORMATION',
                  [
                    MapEntry('Full Name', data['Full Name'] ?? ''),
                    MapEntry('Address', data['Address'] ?? ''),
                    MapEntry('Contact Number', data['Contact Number'] ?? ''),
                    MapEntry('Email Address', data['Email Address'] ?? ''),
                    MapEntry('Date of Birth', data['Date of Birth'] ?? ''),
                    MapEntry('Place of Birth', data['Place of Birth'] ?? ''),
                    MapEntry('Age', data['Age'] ?? ''),
                    MapEntry('Gender', data['Gender'] ?? ''),
                    MapEntry('Civil Status', data['Civil Status'] ?? ''),
                    MapEntry('Citizenship', data['Citizenship'] ?? ''),
                    MapEntry('Religion', data['Religion'] ?? ''),
                    MapEntry('Height', data['Height'] ?? ''),
                    MapEntry('Weight', data['Weight'] ?? ''),
                  ],
                ),

                buildSection(
                  'FAMILY BACKGROUND',
                  [
                    MapEntry(
                      "Father's Name",
                      data["Father's Name"] ?? '',
                    ),
                    MapEntry(
                      "Father's Occupation",
                      data["Father's Occupation"] ?? '',
                    ),
                    MapEntry(
                      "Mother's Name",
                      data["Mother's Name"] ?? '',
                    ),
                    MapEntry(
                      "Mother's Occupation",
                      data["Mother's Occupation"] ?? '',
                    ),
                    MapEntry(
                      'Number of Siblings',
                      data['Number of Siblings'] ?? '',
                    ),
                  ],
                ),

                buildSection(
                  'EDUCATIONAL BACKGROUND',
                  [
                    MapEntry('College School', data['College School'] ?? ''),
                    MapEntry('Course', data['Course'] ?? ''),
                    MapEntry('Year', data['College Year'] ?? ''),
                    MapEntry(
                      'Senior High School',
                      data['Senior High School'] ?? '',
                    ),
                    MapEntry('Strand', data['Strand'] ?? ''),
                    MapEntry(
                      'Year Graduated',
                      data['Senior High Year Graduated'] ?? '',
                    ),
                    MapEntry(
                      'Junior High School',
                      data['Junior High School'] ?? '',
                    ),
                    MapEntry(
                      'Year Graduated',
                      data['Junior High Year Graduated'] ?? '',
                    ),
                    MapEntry(
                      'Elementary School',
                      data['Elementary School'] ?? '',
                    ),
                    MapEntry(
                      'Year Graduated',
                      data['Elementary Year Graduated'] ?? '',
                    ),
                  ],
                ),

                buildSection(
                  'WORK EXPERIENCE',
                  [
                    MapEntry('Company', data['Company'] ?? ''),
                    MapEntry('Position', data['Position'] ?? ''),
                    MapEntry('Duration', data['Duration'] ?? ''),
                  ],
                ),

                buildSection(
                  'TRAININGS AND SEMINARS',
                  [
                    MapEntry(
                      'Training / Seminar',
                      data['Training / Seminar'] ?? '',
                    ),
                    MapEntry('Organizer', data['Organizer'] ?? ''),
                    MapEntry('Date', data['Training Date'] ?? ''),
                  ],
                ),

                buildSection(
                  'SPECIAL SKILLS',
                  [
                    MapEntry(
                      'Special Skills',
                      data['Special Skills'] ?? '',
                    ),
                  ],
                ),

                buildSection(
                  'CHARACTER REFERENCES',
                  [
                    MapEntry(
                      'Reference Name',
                      data['Reference Name'] ?? '',
                    ),
                    MapEntry(
                      'Position',
                      data['Reference Position'] ?? '',
                    ),
                    MapEntry(
                      'Contact Number',
                      data['Reference Contact Number'] ?? '',
                    ),
                  ],
                ),

                SizedBox(height: 30),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Edit'),
                  ),
                ),

                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}