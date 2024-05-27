class MessageResponse {
  final int id;
  final String text;
  final bool isMe;
  final String timeAgo; // Add timeAgo property

  MessageResponse({required this.id, required this.text, required this.isMe, required this.timeAgo});
}