import 'package:helpdesk/utils/files_utils.dart';
import 'package:intl/intl.dart';

import 'index.dart';

class StudentSupportForm extends StatefulWidget {
  const StudentSupportForm({super.key});

  @override
  State<StudentSupportForm> createState() => _StudentSupportFormState();
}

class _StudentSupportFormState extends State<StudentSupportForm> {
  final List<String> _tagOptions = [
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

  final List<String> _mttrOptions = [
    'Choose',
    'Moderately Fast Action ( Complaint must be resolved within 12-24 hours)',
    'Get it done (Complaint must be resolved in 3-5 days)',
    'Required (Complaint must be resolved in 7-14 days) ',
    'Expected ( Complaint must be resolved within 30 days)'
  ];

  String _selectedTagOption = 'Choose';
  String _selectedMTTROption = 'Choose';

  final TextEditingController _problemController = TextEditingController();
  final TextEditingController _actionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  PlatformFile? _attachFile;
  String _filename = 'No document attached...';

  DateTime _date = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showWarning(
            context, "Do you want to decline support request?");
        return shouldPop ?? false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(title: 'Create Ticket'),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: blackColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      underline: const SizedBox(height: 5),
                      value: _selectedTagOption,
                      items: _tagOptions.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomText(
                                  fontSize: 16,
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
                          _selectedTagOption = option!;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Narrate the PROBLEM related to Exams. ",
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
                    minLines: 3,
                    maxLines: 7,
                    controller: _problemController,
                    hintText: 'Your answer',
                    labelText: '',
                  ),
                  getSpaceH(height: 10),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "MTTR: ",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: blackColor,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.normal),
                                  text:
                                      ' Select a flexible "Mean Time To Resolve ',
                                  children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: blackColor,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w800),
                                        text:
                                            ' (NB: No request is URGENT. You may have delayed to act on time. The fasted action may take more than 12 hours after submission. Be real in choosing your MTTR.) ')
                                  ])
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  getSpaceH(height: 10),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        border: Border.all(color: blackColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: DropdownButton(
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(10),
                      underline: const SizedBox(height: 5),
                      value: _selectedMTTROption,
                      items: _mttrOptions.map((option) {
                        return DropdownMenuItem(
                          value: option,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CustomText(
                                  fontSize: 16,
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
                          _selectedMTTROption = option!;
                        });
                      },
                    ),
                  ),
                  getSpaceH(height: 10),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "What",
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: blackColor,
                                fontWeight: FontWeight.normal),
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.bold),
                                  text: ' ACTION ',
                                  children: [
                                    TextSpan(
                                        style: TextStyle(
                                            color: blackColor,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.normal),
                                        text:
                                            'do you want from the exams office? ( Use a specific verb to start) ')
                                  ])
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomTextField(
                    minLines: 2,
                    maxLines: 5,
                    controller: _actionController,
                    hintText: 'Your answer',
                    labelText: '',
                  ),
                  getSpaceH(height: 10),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "You may upload any file format, including audio and video narration, via your online drive link, as evidence to clarify the written",
                            style: TextStyle(
                                color: blackColor,
                                fontWeight: FontWeight.normal),
                            children: [
                              TextSpan(
                                  style: TextStyle(
                                      color: blackColor,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold),
                                  text: ' Problem (Optional).')
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: Row(
                      children: [
                        CustomElevatedButton(
                            elevation: 3,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                            onPressed: () {
                              pickFile(
                                      allowedExtensions: ['pdf', 'doc', 'jpg'],
                                      allowMultiple: false)
                                  .then((value) {
                                setState(() {
                                  _attachFile = value!.files.first;
                                  _filename =
                                      "${shortenPath(value: _attachFile!.name, length: 15)}${_attachFile!.extension!}";
                                });
                              });
                            },
                            child: const CustomText(
                              label: 'Attach file',
                              color: whiteColor,
                            )),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                border: Border.all()),
                            child: Center(
                              child: CustomText(
                                label: _filename,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  getSpaceH(height: 10),
                  getSpaceH(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Select specific due date on the MTTR ",
                                style: TextStyle(
                                    color: blackColor,
                                    fontWeight: FontWeight.normal),
                                children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: blackColor,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold),
                                      text: '(Optional).')
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      getSpaceH(height: 8),
                      OutlinedButton(
                        child:
                            CustomText(label: DateFormat.yMMMd().format(_date)),
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                  getSpaceH(height: 20),
                  CustomElevatedButton(
                    width: double.infinity,
                    borderRadius: BorderRadius.circular(15),
                    child: const CustomText(
                      label: 'Submit',
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                            body: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          gradient: LinearGradient(colors: [
                                            redColor,
                                            redColor.withAlpha(123)
                                          ]),
                                          child: const CustomText(
                                            label: "Cancel",
                                            color: whiteColor,
                                          )),
                                    ),
                                    getSpaceW(width: 20),
                                    Expanded(
                                      child: CustomElevatedButton(
                                          gradient: const LinearGradient(
                                              colors: greenColorGradient),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          onPressed: () {
                                            Navigator.pop(context);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                              content: CustomText(
                                                label: 'Processing request...',
                                                fontSize: 18,
                                                color: Colors.white,
                                              ),
                                            ));
                                          },
                                          child: const CustomText(
                                            label: "Confirm",
                                            color: whiteColor,
                                          )),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            title: "Confirm Submission"),
                      );
                    },
                  ),
                  getSpaceH(height: 20)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
