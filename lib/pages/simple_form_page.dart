import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:learn_flutter/widgets/image_gallery.dart';

import '../service/mock_service.dart';
import '../utilities/validators.dart';

class SimpleForm extends StatefulWidget {
  const SimpleForm({super.key});

  @override
  State<SimpleForm> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  final _formKey = GlobalKey<FormState>();
  late List<Uint8List> imageFileBytes = [];
  bool isImageSelected = false;

  Future<void> _submitForm() async => {
        if (_formKey.currentState!.validate())
          {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                NetworkService.postData(context);

                return Stack(
                  alignment: Alignment.center,
                  children:  [
                    const ModalBarrier(dismissible: false, color: Colors.black54),
                    SizedBox(
                      height: 500,
                      width: 500,
                      child: Column(
                        children: const [
                          Text(
                            "Uploading...",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 16),
                          LinearProgressIndicator(),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Form"),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "First Name",
                        helperText: " ",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Last Name",
                        helperText: " ",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // ignore: prefer_const_constructors
            Flexible(
              child: const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Small Description',
                    helperText: " ",
                    alignLabelWithHint: true),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
              ),
            ),
            const SizedBox(height: 16),
            Flexible(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  helperText: " ",
                ),
                validator: (value) => validateEmail(value),
              ),
            ),
            const SizedBox(height: 16),
            ImageGallery(imageFileBytes: imageFileBytes),
            const SizedBox(height: 16),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () async {
                    final image = await ImagePickerWeb.getImageAsBytes();

                    setState(() {
                      if (image != null) {
                        imageFileBytes.add(image);
                      }
                      if (imageFileBytes.isNotEmpty) {
                        isImageSelected = true;
                      }
                    });
                  },
                  icon: const Icon(Icons.add, size: 24),
                  label: const Text("Add Images"),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => _submitForm(),
                  child: const Text('Submit'),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
