import 'package:cropco/widgets/text_field.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: 500,
          width: double.infinity,
          child: IntrinsicHeight(
            child: Card(
              child: Column(
                children: [
                  const CTextField(
                    isKeyboardtype: true,
                    ishidden: false,
                    isicon2: false,
                    isicon3: false,
                    isicon: false,
                    text: 'Write your content here',
                    isheight: true,
                    height: 250,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.post_add),
                      Icon(Icons.add_a_photo_outlined),
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
}
