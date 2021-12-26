class Review {
  final String imagePath;
  final String userName;
  final String comment;
  final int starsNumber;

  Review(
      {required this.starsNumber,
      required this.imagePath,
      required this.userName,
      required this.comment});
}

List<Review> reviews = [
  Review(
      imagePath: 'assets/ali.jpg',
      userName: 'Ali Ibrahim',
      comment: "The quality of the clothes here don't always disappoint me",
      starsNumber: 4),
  Review(
      starsNumber: 5,
      imagePath: 'assets/mohamed.jpg',
      userName: 'Mohamed Hajer',
      comment:
          "I was hesitant about buying it, but the price, shape and colors are perfect, and now I don't regret it")
];
