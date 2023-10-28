


import 'package:flutter/material.dart';

import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatefulWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

  @override
  State<MyMessageBubble> createState() => _MyMessageBubbleState();
}

class _MyMessageBubbleState extends State<MyMessageBubble> {
  @override
  Widget build(BuildContext context) {
    final colors=Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment:CrossAxisAlignment.end,
      children: [
        
        Container(
         
          decoration:  BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),

            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
             child: Text(widget.message.text ?? "", style: const TextStyle(color: Colors.white)),


            ),
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}