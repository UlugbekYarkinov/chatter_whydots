import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.sender, required this.text});

  final String sender;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text(
              sender,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.black54,
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.circular(30.0),
            elevation: 5.0,
            color: Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
