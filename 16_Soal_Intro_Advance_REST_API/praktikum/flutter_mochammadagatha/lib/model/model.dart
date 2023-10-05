class Users {
    String? name;
    String? job;
    String? id;
    DateTime createdAt;

    Users({
         this.name,
         this.job,
         this.id,
         DateTime? createdAt,
    }) : createdAt = createdAt ?? DateTime.now();

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]??DateTime.now()),
    );
    Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
    };
}