class MessageModel {
  final String username;
  final DateTime time;
  final String lastMessage;
  final String image;

  const MessageModel(
      {required this.lastMessage,
      required this.image,
      required this.time,
      required this.username});
}
