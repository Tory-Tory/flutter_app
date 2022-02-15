class Users
{
  int id;
  String name;

  Users(this.id, this.name);

  Users.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}