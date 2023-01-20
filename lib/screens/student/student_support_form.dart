import 'index.dart';

class StudentSupportForm extends StatefulWidget {
  const StudentSupportForm({super.key});

  @override
  State<StudentSupportForm> createState() => _StudentSupportFormState();
}

class _StudentSupportFormState extends State<StudentSupportForm> {
  final List<String> _options = [
    'Choose',
    'Registration of semester course(s) (New /Add / Remove/ Replace)',
    'Registered course(s) cannot be found on my portal',
    'Supplementary Exams Registration',
    'Repeating a semester',
    'Forgot to sign the attendance sheet at the Exams hall',
    'Wrong index number',
    'Medical Reason(s). Eg Sick',
    'Trail of paper (F)',
    'Results of written exams cannot be found',
    'Re-marking',
    'Sudden change of previous grades on the system (GPA/CGPA)',
    'Under Investigation (Exams Malpractice)',
    'Owning School Fees',
    'Owning Hostel Fees',
    'Transcript Request',
    'Deferred Tag ',
    'Rusticated Tag',
    'Withdrawn Tag',
    'Dismissed Tag',
    'Reinstatement Tag',
    'Permanently Removed Tag',
    'Other'
  ];

  String _selectedOption = 'Choose';

  final TextEditingController _textFieldController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(title: 'Create Ticket'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSpaceH(height: 20),
                const CustomText(
                  textAlign: TextAlign.left,
                  label: "Select Ticket Tag: ",
                  fontWeight: FontWeight.bold,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                      border: Border.all(color: blackColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    underline: const SizedBox(height: 5),
                    value: _selectedOption,
                    items: _options.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 1),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CustomText(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                label: option,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (option) {
                      setState(() {
                        _selectedOption = option!;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20,bottom: 10),
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Narrate the PROBLEM related to Exams.",
                          style: TextStyle(
                              color: blackColor, fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                                style: TextStyle(
                                    color: blackColor,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.normal),
                                text:
                                    '(You may insert or paste a link to a file in your online drive to support complaint. Add course code & name where relevant). ')
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                CustomTextField(
                  minLines: 5,
                  maxLines: 10,
                  controller: _textFieldController,
                  hintText: 'Type Something',
                  labelText: '',
                ),
                getSpaceH(height: 10),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          getSpaceH(height: 10),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.upload_file),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomText(label: 'Upload Document'),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                CustomElevatedButton(
                  width: double.infinity,
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
      ),
    );
  }
}
