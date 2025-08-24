import 'package:cropco/widgets/circular_container.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatefulWidget {
  const PostContainer({super.key, this.isImage = false});
  final bool? isImage;

  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Row(
              children: [
                CircularContainer(
                  margin: const EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  radius: 50,
                  color: Colors.black,
                  child: ClipOval(
                    child: Image.asset(
                      "assets/images/brocoli.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('AI enthuziast....')
                  ],
                )
              ],
            ),
            IntrinsicWidth(
              child: IntrinsicHeight(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Text(
                    'I am very excited to share about my recent certification I got by completing generative AI course of Google.I am very excited to share about my recent certification I got by completing generative AI course of Google.I am very excited to share about my recent certification I got by completing generative AI course of Google.',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: widget.isImage == false
                  ? Container(
                      height: 200,
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/b-1.jpg"),
                      ),
                    )
                  : null,
            ),
            
            const Divider(
              height: 10,
              indent: 30,
              endIndent: 30,
              color: Colors.grey,
            ),
            SizedBox(height: 10,),
            Container(
              height: 50,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13),
                  bottomRight: Radius.circular(13),
                ),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.thumb_up_alt_outlined,
                    ),
                  ),
                  /*const SizedBox(
                    width: 10,
                  ),*/
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.comment_outlined,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border),
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
