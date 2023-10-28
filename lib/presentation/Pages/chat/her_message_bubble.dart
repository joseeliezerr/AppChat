import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class herMessageBubble extends StatefulWidget {

  final Message message;

  const herMessageBubble({super.key, required this.message});

  

  @override
  State<herMessageBubble> createState() => _herMessageBubbleState();
}

class _herMessageBubbleState extends State<herMessageBubble> {
  @override
  Widget build(BuildContext context) {
    final colors=Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        
        Container(
         
          decoration:  BoxDecoration(
            color: colors.secondary,
            borderRadius: BorderRadius.circular(20),

            ),
            child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(widget.message.text ?? '', style: TextStyle(color: Colors.white)),

            ),
        ),
        const SizedBox(height: 10),
       
        _imageBublle(widget.message.imageUrl!),
        SizedBox(height: 10)
      ],
    );
  }
}

class _imageBublle extends StatelessWidget {
  final imageUrl;

  const _imageBublle(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final Size=MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageUrl,
      width: Size.width*0.7,
      height: 150,
      fit: BoxFit.cover,
     loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;

  return Container(
    width: Size.width * 0.7,
    height: 150,
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Text('Mi amor esta enviando una imagen'),
  );
},

      ));
  }
}