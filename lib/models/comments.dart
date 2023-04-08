class Comment {
  int comment_id;
  int post_id;
  String user_id;
  String text;

  Comment(
      {required this.comment_id,
      required this.post_id,
      required this.user_id,
      required this.text});
}
