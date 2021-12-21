class ChatList{
  ChatList({required this.me, required this.lastChat, required this.personName, required this.personPhone, required this.personPicture, required this.roomID});

  //field
  final String me;
  final String lastChat;
  final String personName;
  final String personPhone;
  final String personPicture;
  final String roomID;

  //converters
  ChatList.fromJson(Map<String, Object?> json)
      : this(
    me: json['me']! as String,
    lastChat: json['lastChat']! as String,
    personName: json['personName']! as String,
    personPhone: json['personPhone']! as String,
    personPicture: json['personPicture']! as String,
    roomID: json['roomID']! as String,
  );

  Map<String, Object?> toJson() {
    return {
      'me': me,
      'lastChat': lastChat,
      'personName': personName,
      'personPhone': personPhone,
      'personPicture': personPicture,
      'roomID': roomID,
    };
  }
}