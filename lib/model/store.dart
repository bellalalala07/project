class Store {
  String uid;
  String name;
  String description;
  String rating;
  String image;
  String cuisine;

  Store(
      {this.uid,
      this.name,
      this.description,
      this.rating,
      this.image,
      this.cuisine});

  Store.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];
    description = data['description'];
    rating = data['rating'];
    image = data['image'];
    cuisine = data['cuisine'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'description': description,
      'rating': rating,
      'image': image,
      'cuisine': cuisine,
    };
  }
}
