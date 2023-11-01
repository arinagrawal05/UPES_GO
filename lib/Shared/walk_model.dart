class WalkthoughContent {
  String image;
  String title;
  String discription;

  WalkthoughContent(
      {required this.image, required this.title, required this.discription});
}

String img = "assets/images/1.png";
List<WalkthoughContent> contents = [
  WalkthoughContent(
      title: 'Welcome To UPES GO',
      image: img,
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  WalkthoughContent(
      title: 'Clubs & Events',
      image: img,
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  WalkthoughContent(
      title: 'Faculty Connect',
      image: "assets/images/2.png",
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  WalkthoughContent(
      title: 'Resell Old Stuff',
      image: "assets/images/3.png",
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  WalkthoughContent(
      title: 'Part Discussions',
      image: "assets/images/4.png",
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
  WalkthoughContent(
      title: 'Campus News & Announcements ',
      image: "assets/images/5.png",
      discription:
          "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
          "industry's standard dummy text ever since the 1500s, "
          "when an unknown printer took a galley of type and scrambled it "),
];
