

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_gemini_flutter/controller/google_gemini.dart';
import 'package:google_gemini_flutter/widgets/loadingText.dart';
import 'package:google_gemini_flutter/widgets/userText.dart';

import '../Modal/chatModel.dart';
import '../widgets/botText.dart';

List<chatModel> chat = [];
List<Widget> chatWidget  =[Image(image: AssetImage("assets/Google-Gemini-Logo-758x473-removebg-preview.png"),),];
bool isLoading  = false;


void addChatUser(chatModel chatItem){
  chat.add(chatItem);
  updateChatWidget();
}

Future<void> addChatBot(chatModel chatItem)async {

  //implement google gemini
  String sector = 'Security and Defense';


  final res = await generateContent(chatItem.text, '${sector} sector perspective i can make from a nation prospective if there is ${chatItem.text}. give me the outcome in arabic in very professional way talk like a nation crisis manager, All the answers should be answered according to Egypt and Arab culture and traditions, and the answers should be in Arabic ');


  chat.add(chatModel(res, "bot"));
  updateChatWidget();
}

void updateChatWidget(){
  chatWidget = [Image(image: AssetImage("assets/Google-Gemini-Logo-758x473-removebg-preview.png"),),SizedBox(height: 20,)];
  for(int i = 0;i<chat.length;i++){
    if(chat[i].type=="user"){
      chatWidget.add(userText(chat[i].text));
    }else{
      chatWidget.add(botText(chat[i].text));
    }
    chatWidget.add(SizedBox(height: 20,));
  }
}

