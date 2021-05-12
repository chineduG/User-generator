class Results {
  String name;
  String email;
  String picture;
  String phone;

  Results({
    this.name,
    this.email,
    this.picture,
    this.phone,
  });

  Results.fromJson(Map<String, dynamic> json)
      : name =
            '${json['name']['title']} ${json['name']['first']} ${json['name']['last']}',
        phone = json['phone'],
        picture = json['picture']['thumbnail'],
        email = json['email'];
}
