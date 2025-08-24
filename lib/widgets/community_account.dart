import 'package:cropco/widgets/circular_container.dart';
import 'package:flutter/material.dart';

class CommunityAccount extends StatelessWidget {
  const CommunityAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            Container(
              height: kToolbarHeight + 70,
              color: Colors.grey,
            ),
            Positioned(
              top: 10,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const Positioned(
              top: 70,
              left: 20,
              bottom: -40,
              child: CircularContainer(
                radius: 100,
                height: 400,
                width: 100,
                color: Colors.amber,
              ),
            ),
          ]),
          const SizedBox(
            height: 45,
          ),
          IntrinsicHeight(
            child: IntrinsicWidth(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Your Name',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'hjdhkadksd hsudhsi djsdknmsadn udshdkliablkd iuwdwdhsjdsldirlc  hieljlshjsdheuhui',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Connect'),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Message'),
                            ),
                          ],
                        ),
                      ),
                      
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Posts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20
                          ),
                        ),
                      ),
                      const Divider(
                        height: 0,
                        thickness: 2,
                        indent: 10,
                        endIndent: 10,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
