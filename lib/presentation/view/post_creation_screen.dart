import 'package:flutter/material.dart';

class PostCreationScreen extends StatefulWidget {
  const PostCreationScreen({Key? key}) : super(key: key);

  @override
  State<PostCreationScreen> createState() => _PostCreationScreenState();
}

class _PostCreationScreenState extends State<PostCreationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.green,
          child: Center(
            child: Text(
              'this is post creation',
            ),
          ),
        ),
      ),
    );
  }
}
