import 'package:flutter/material.dart';

class OrderAcceptanceView extends StatelessWidget {
  const OrderAcceptanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Rivew Section'),
      ),
      body: ListTile(
        title: const Text('2 kg*carrot + 3pcs*avocado'),
        subtitle: const Text('Price- 60/-'),
        trailing: Row(
          children: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Accept',
                  style: TextStyle(color: Colors.green),
                )),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Reject',
                  style: TextStyle(color: Colors.green),
                ))
          ],
        ),
      ),
    );
  }
}
