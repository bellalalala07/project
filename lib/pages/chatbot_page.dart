import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project/pages/drawer_page.dart';
import 'package:http/http.dart' as http;

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  List<Map<String, dynamic>> saveChat = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chatbot"),
      ),
      drawer: DrawerPage(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 160,
            child: ListView.builder(
              itemCount: saveChat.length,
              controller: scrollController,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: (saveChat[index]["isSender"]
                        ? Alignment.topRight
                        : Alignment.topLeft),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (saveChat[index]["isSender"]
                            ? Colors.green
                            : Colors.blue),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        saveChat[index]["message"],
                        style: TextStyle(
                            fontSize: 15,
                            color: saveChat[index]["isSender"]
                                ? Colors.white
                                : Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              height: 75,
              color: Colors.grey.shade400,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Type a message",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          minLines: 1,
                          maxLines: 3,
                          controller: textController,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        if (textController.text.isNotEmpty) {
                          saveChat.add({
                            "time": DateTime.now(),
                            "message": textController.text,
                            "isSender": true,
                          });
                          textController.clear();
                        }
                      });
                      scrollController.jumpTo(
                        scrollController.position.maxScrollExtent,
                      );
                      getAIReply();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.send,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> getAIReply() async {
    final url =
        "https://generativelanguage.googleapis.com/v1beta2/models/chat-bison-001:generateMessage?key=AIzaSyA1W2nhxTIDJnlnJh4QDaJCNkhIOD8nqIs";
    final uri = Uri.parse(url);
    List<Map<String, String>> msg = [];
    for (var i = 0; i < saveChat.length; i++) {
      msg.add({"content": saveChat[i]["message"]});
    }

    Map<String, dynamic> request = {
      "prompt": {
        "messages": [msg]
      },
      "temperature": 0.25,
      "candidateCount": 1,
      "topP": 1,
      "topK": 1
    };

    final response = await http.post(uri, body: jsonEncode(request));

    setState(() {
      saveChat.add({
        "time": DateTime.now(),
        "message": json.decode(response.body)["candidates"][0]["content"],
        "isSender": false,
      });
    });

    scrollController.jumpTo(
      scrollController.position.maxScrollExtent,
    );
  }
}
