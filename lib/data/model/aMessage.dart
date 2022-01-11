class Message{
  Message({required this.content, required this.iSendIt, required this.roomID, required this.senderName, required this.timestamp});

  //field
  final String content;
  final bool iSendIt;
  final String roomID;
  final String senderName;
  final int timestamp;

  //converters
  Message.fromJson(Map<String, Object?> json)
      : this(
    content: json['content']! as String,
    iSendIt: json['iSendIt']! as bool,
    roomID: json['roomID']! as String,
    senderName: json['senderName']! as String,
    timestamp: json['timestamp']! as int,
  );

  Map<String, Object?> toJson() {
    return {
      'content': content,
      'iSendIt': iSendIt,
      'roomID': roomID,
      'senderName': senderName,
      'timestamp': timestamp,
    };
  }
}