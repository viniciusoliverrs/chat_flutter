import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final Map<String, dynamic> data;
  final bool mine;
  ChatMessage(this.data, this.mine);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          !this.mine
              ? Padding(
                  padding: EdgeInsets.all(20),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPhotoUrl']),
                  ),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  this.mine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                data['imgUrl'] != null
                    ? Image.network(data['imgUrl'], width: 250)
                    : Text(
                        data['text'],
                        style: TextStyle(fontSize: 16),
                      ),
                Text(
                  data['senderName'],
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          this.mine
              ? Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(data['senderPhotoUrl']),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
