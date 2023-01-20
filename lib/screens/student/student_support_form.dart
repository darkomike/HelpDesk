import 'index.dart';

class StudentSupportForm extends StatefulWidget {
  const StudentSupportForm({super.key});

  @override
  State<StudentSupportForm> createState() => _StudentSupportFormState();
}

class _StudentSupportFormState extends State<StudentSupportForm> {
  final List<String> _options = [
    'Select Support Topic',
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  String _selectedOption = 'Select Support Topic';

  final TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Create Ticket')),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              getSpaceH(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                  value: _selectedOption,
                  items: _options.map((option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    );
                  }).toList(),
                  onChanged: (option) {
                    setState(() {
                      _selectedOption = option!;
                    });
                  },
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Column(
                  children: const [
                    Icon(Icons.file_upload),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 5),
                      child: CustomText(label: 'Upload Documnet'),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: CustomTextField(
                  minLines: 5,
                  maxLines: 10,
                  controller: _textFieldController,
                  hintText: 'Type Something',
                  labelText: 'Description',
                ),
              ),
              CustomElevatedButton(
                borderRadius: BorderRadius.circular(15),
                child: const CustomText(
                  label: 'Submit',
                  fontSize: 18,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
