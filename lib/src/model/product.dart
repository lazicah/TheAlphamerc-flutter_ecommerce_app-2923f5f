class Product {
  int id;
  String name;
  String category;
  String image;
  double price;
  bool isliked;
  bool isSelected;
  String description;
  Product(
      {this.id,
      this.name,
      this.category,
      this.price,
      this.isliked,
      this.isSelected = false,
      this.image,
      this.description});
}
