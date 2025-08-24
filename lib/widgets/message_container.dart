import 'package:flutter/material.dart';

class MessageContainer extends StatelessWidget {
  final bool isUser;
  final String message;
  //final String date ;
  const MessageContainer(
      {super.key,
      required this.isUser,
      required this.message,
       });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ).copyWith(
        left: isUser ? 100 : 10,
        right: isUser ? 10 : 100,
      ),
      decoration: BoxDecoration(
        color: isUser ? Colors.blueAccent : Colors.grey.shade400,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10),
          bottomLeft: isUser ? const Radius.circular(10): Radius.zero,
          topRight: const Radius.circular(10),
          bottomRight: isUser ? Radius.zero : const Radius.circular(10)
        )
      ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 16,color: isUser ? Colors.white: Colors.black),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
            '  ${DateTime.now().hour.toString().padLeft(2,'0')} : ${DateTime.now().minute.toString().padLeft(2,'0')}',
              style: TextStyle(fontSize: 10,color: isUser ? Colors.white: Colors.black,),
            ),
          )
        ],
      ),
    );
  }
}
