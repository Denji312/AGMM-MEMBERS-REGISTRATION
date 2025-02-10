import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class RegPageWidget extends StatefulWidget {
  const RegPageWidget({super.key});

  @override
  State<RegPageWidget> createState() => _RegPageWidgetState();
}

class _RegPageWidgetState extends State<RegPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController textController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final FocusNode textFieldFocusNode = FocusNode();
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 2,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );

  File? _image; // Store captured image

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    textController.dispose();
    searchController.dispose();
    textFieldFocusNode.dispose();
    signatureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFE08A2A),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 2,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: textController,
                    focusNode: textFieldFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Enter Name here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  CircleAvatar(
                    radius: screenWidth * 0.25,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    backgroundColor: Colors.grey[300],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Camera'),
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: screenWidth * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Signature(
                      controller: signatureController,
                      backgroundColor: Colors.white,
                      height: screenHeight * 0.2,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      signatureController.clear();
                    },
                    child: Text('Reset Signature'),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: _buildDecoratedButton('Attendance Slip')),
                      SizedBox(width: 10),
                      Expanded(child: _buildDecoratedButton('Meal Coupon')),
                      SizedBox(width: 10),
                      Expanded(child: _buildDecoratedButton('Raffle Ticket')),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDecoratedButton(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: Colors.blue,
        ),
        child: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
