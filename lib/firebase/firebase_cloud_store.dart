import 'index.dart';

class FirestoreService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // CRUD operations go here
  Future<void> addDocument(String collection, Map<String, dynamic> data) async {
    await _firestore.collection(collection).add(data);
  }

  Stream<DocumentSnapshot> getDocument(String collection, String documentId) {
    return _firestore.collection(collection).doc(documentId).snapshots();
  }

  Future<void> updateDocument(
      String collection, String document, Map<String, dynamic> data) async {
    await _firestore.collection(collection).doc(document).update(data);
  }

  Future<void> deleteDocument(String collection, String document) async {
    await _firestore.collection(collection).doc(document).delete();
  }

  Stream<List<DocumentSnapshot>> getDocuments(String collection) {
    return _firestore
        .collection(collection)
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }

  Future<bool> isUserAuthenticatedAndSaved() async {
    User? user = _auth.currentUser;
    if (user != null) {
      DocumentSnapshot snapshot =
          await _firestore.collection("users").doc(user.uid).get();
      return snapshot.exists;
    }
    return false;
  }

  static Future<void> checkUserRole(
      {required String userID,
      required String collection,
      required BuildContext context,
      required Widget widget}) async {
    await _firestore
        .collection("admin")
        .doc(userID)
        .get()
        .then((DocumentSnapshot snapshot) {
      Provider.of<AppState>(context, listen: false)
          .setIsUserLoggedIn(value: true);
     NavUtils. pushReplace(
        context: context,
        destination: widget,
      );
    }).catchError((error) {
      // Handle any errors that occurred
      if (kDebugMode) {
        print(error);
      }
      showDialog(
        context: context,
        builder: (context) => CustomDialog(
            dividerColor: redColor,
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(
                    label: "${error.message}", overflow: TextOverflow.visible),
                  AppUtils. getSpaceH(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: redColor),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const CustomText(label: "OK"),
                    )
                  ],
                )
              ],
            ),
            title: 'Something went wrong'),
      );
    });
  }
}
