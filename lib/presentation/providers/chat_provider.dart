import 'package:flutter/material.dart';
import 'package:yes_no_app/config/theme/helpers/get_yes_no_asnwer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chaScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();


  List<Message> messageList = [
    Message(text: 'Hola Amor!', fromWho: FromWho.me, imageUrl: ''),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me, imageUrl: ''),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    // TODO: implementar método
    final newMessage = Message(text: text, fromWho: FromWho.me, imageUrl: '');
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      await herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessageBubble = await getYesNoAnswer.getAnswer();
    messageList.add(herMessageBubble);
      notifyListeners();
      moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(Duration(milliseconds: 100));
    chaScrollController.animateTo(
      chaScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
