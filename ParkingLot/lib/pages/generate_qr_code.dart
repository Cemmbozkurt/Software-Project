import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneraterQRCode extends StatefulWidget {
  const GeneraterQRCode({Key? key}) : super(key: key);

  @override
  _GeneraterQRCodeState createState() => _GeneraterQRCodeState();
}

class _GeneraterQRCodeState extends State<GeneraterQRCode> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var _stream =
        FirebaseFirestore.instance.collection('Users').doc().snapshots();
    String email = 'User email';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: email,
                size: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
