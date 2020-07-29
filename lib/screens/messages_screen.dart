import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchatapplication/models/message_model.dart';
import 'package:flutterchatapplication/models/user_model.dart';

class MessageScreen extends StatefulWidget {
  final User user;

  MessageScreen({this.user});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  _buildMessages(Message message, bool isMe) {
    final Container _con = Container(
      decoration: isMe
          ? BoxDecoration(
          color: Theme
              .of(context)
              .accentColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              topLeft: Radius.circular(15.0)))
          : BoxDecoration(
          color: Color(0xFFFFEFEE),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0))),
      margin: isMe
          ? EdgeInsets.only(left: 50.0, top: 10, bottom: 10.0)
          : EdgeInsets.only(right: 50.0, top: 10, bottom: 10.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            message.text,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.75,
    );

    if (isMe) {
      return _con;
    } else {
      return Row(
        children: <Widget>[
          _con,
          IconButton(
            iconSize: 25.0,
            icon: message.isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            color: message.isLiked ? Colors.red : Color(0xFFFFEFEE),
            onPressed: () {},
          )
        ],
      );
    }
  }

  _buildMessagegenerator() {
    return Container(
      height: 70.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            iconSize: 25.0,
            icon: Icon(Icons.photo_library),
            color : Colors.red,
            onPressed: () {},
          ),

          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: "Type a message...."),
              onChanged: (value){},

            ),
          ),

          IconButton(
            iconSize: 25.0,
            icon: Icon(Icons.send),
            color : Colors.red,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text(widget.user.name),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.more_horiz,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  child: ListView.builder(
                      reverse: true,
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Message message = messages[index];
                        final bool isMe = message.sender.id == currentUser.id;
                        return _buildMessages(message, isMe);
                      }),
                ),
              ),
            ),
            _buildMessagegenerator(),
          ],
        ),
      ),
    );
  }
}
