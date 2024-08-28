import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:stater_project/res/barrel_file.dart';
import 'package:stater_project/services/idGenerater/id_generater.dart';

class PaymentProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController itemsNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  // Variable to track the loading state
  bool isLoading = false;

  int isvisible = 0;
  onVisibletyChange(int index) {
    print(index);
    isvisible = index;
    notifyListeners();
  }

  // Reference to the Firebase Realtime Database at the 'post' node
  final firebaseRef = FirebaseDatabase.instance.ref('Debit');

  // Generate a unique ID based on the current time in milliseconds
  String id = IdGenerator().generateCreditId();

  // Function to send data to the Firebase Realtime Database
  onSendData() async {
    // Set loading state to true and notify listeners
    isLoading = true;
    notifyListeners();

    // Extract text from the TextEditingController instances
    String name = nameController.text.toString();
    String itemsName = itemsNameController.text.toString();
    String price = priceController.text.toString();
    String details = detailsController.text.toString();

    // Create a new child node with the current ID, and a nested child node 'kripesh'
    await firebaseRef.child("$name$id").set({
      // Add data to the 'kripesh' node
      "name": name, // Set title to the text from the controller
      "price": price, // Set price to the text from the controller
      "itemsName": itemsName, // Set itemsName to the text from the controller
      "details": details, // Set details to the text from the controller
      "id": id, // Set id to the current ID
      "date": DateTime.now().toString() // Ensure date is stored as a string
    }).then((value) {
      // Once the data is successfully written, generate a new unique ID
      id = DateTime.now().millisecondsSinceEpoch.toString();

      // Clear the text input fields
      nameController.clear();
      itemsNameController.clear();
      priceController.clear();
      detailsController.clear();

      // Notify listeners that the state has changed
      notifyListeners();
    });

    // Set loading state to false and notify listeners
    isLoading = false;
    notifyListeners();
  }

  final TextEditingController searchController = TextEditingController();
  final TextEditingController updateController = TextEditingController();

  onSearch(value) {
    notifyListeners();
  }

  void showInputDialog(BuildContext context, String title, String id) {
    final _formKey = GlobalKey<FormState>();
    String _inputValue = '';
    updateController.text = title;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Input Dialog'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: updateController,
              decoration: InputDecoration(
                labelText: 'Enter your value',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (value) {
                _inputValue = value!;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print('Input value: $_inputValue');
                  Navigator.of(context).pop();
                  firebaseRef.child(id).update({
                    "title": updateController.text.toString(),
                  }).then((value) {
                    if (kDebugMode) {
                      print("update successfull");
                    }
                  }).onError((error, stackTrace) {
                    if (kDebugMode) {
                      print(error.toString().toString());
                    }
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }
}
