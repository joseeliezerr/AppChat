import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/Pages/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/Pages/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pbs.twimg.com/profile_images/697277091616690176/wctQ2I_Q_400x400.jpg')),
          ),
          title: const Text('Mi amor'),
          centerTitle: false,
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final chatProvider=context.watch<ChatProvider>();




    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller:chatProvider.chaScrollController ,
              itemCount:chatProvider.messageList.length,
              itemBuilder: (context, index) {
              
            final message =chatProvider.messageList[index];
            return (message.fromWho==FromWho.hers)?herMessageBubble(message:message):MyMessageBubble(message: message,);
            })),


            MessageFieldBox(
              //onValue: (value)=>chatProvider.sendMessage(value),
              onValue:chatProvider.sendMessage,

            ),
          ],
        ),
      ),
    );
  }
}
