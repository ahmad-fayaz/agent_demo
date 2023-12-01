class Student {
  final String name;
  final String usn;

  Student({
    required this.name,
    required this.usn
  });

  Student.fromJson(Map<String, Object?> json)
      : this(
      name: json['name']! as String,
      usn: json['usn']! as String
  );

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'usn': usn
    };
  }

}