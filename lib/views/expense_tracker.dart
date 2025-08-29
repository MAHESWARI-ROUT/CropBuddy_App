import 'package:cropco/widgets/list_textfield.dart';
import 'package:cropco/widgets/profit_loss_graph.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseTracker extends StatelessWidget {
  const ExpenseTracker({super.key});

  @override
  Widget build(BuildContext context) {
    String todaysDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    return Scaffold(
      backgroundColor: const Color(0xFF256C34), //const Color(0xFF667E06),
      appBar: AppBar(
        backgroundColor: const Color(0xFF256C34), //const Color(0xFF667E06),
        title: const Text(
          'Expense Tracker',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0),
          color: const Color(0xFF256C34), //const Color(0xFF667E06),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: ProfitLossGraph(),
            ),
            Positioned(
              top: 230,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color:
                      Color(0xFFA5D15B), //Color.fromARGB(255, 193, 225, 156),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Image.asset(
                        "assets/images/wallet.png",
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            const Text(
                              ' \$ 1257',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              todaysDate,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.only(top: 30),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 360,
              left: 0,
              right: 0,
              bottom: 0,
              child: ClipRRect(
                borderRadius:const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen[100],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: const Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          ListTextfield(price: 12.34, itemName: 'Tomato 2 kg'),
                          ListTextfield(price: 12.34, itemName: 'Tomato 2 kg'),
                          ListTextfield(price: 12.34, itemName: 'Tomato 2 kg'),
                          ListTextfield(price: 12.34, itemName: 'Tomato 2 kg'),
                          ListTextfield(price: 12.34, itemName: 'Tomato 2 kg'),
                          ListTextfield(price: 12.34, itemName: 'Tomato 2 kg'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              right: 5,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_circle_outlined,
                  size: 60,
                  color: Color.fromARGB(255, 23, 72, 26),
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(255, 50, 125, 53),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
