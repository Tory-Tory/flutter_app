class ToDoList
{
  int id;
  int userId;
  String title;
  bool completed;

  ToDoList(this.id, this.userId, this.title, this.completed);

  ToDoList.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userId = json['userId'],
        title = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'title': title,
    'completed': completed,
  };
}