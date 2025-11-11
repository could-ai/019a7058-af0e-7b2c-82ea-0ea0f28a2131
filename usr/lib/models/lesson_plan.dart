class LessonPlan {
  final String id;
  final String title;
  final String subject;
  final String grade;
  final String level;
  final String duration;
  final String objectives;
  final String materials;
  final String activities;
  final String assessment;
  final String notes;
  final DateTime createdAt;

  LessonPlan({
    required this.id,
    required this.title,
    required this.subject,
    required this.grade,
    required this.level,
    required this.duration,
    required this.objectives,
    required this.materials,
    required this.activities,
    required this.assessment,
    required this.notes,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subject': subject,
      'grade': grade,
      'level': level,
      'duration': duration,
      'objectives': objectives,
      'materials': materials,
      'activities': activities,
      'assessment': assessment,
      'notes': notes,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory LessonPlan.fromJson(Map<String, dynamic> json) {
    return LessonPlan(
      id: json['id'] as String,
      title: json['title'] as String,
      subject: json['subject'] as String,
      grade: json['grade'] as String,
      level: json['level'] as String,
      duration: json['duration'] as String,
      objectives: json['objectives'] as String,
      materials: json['materials'] as String,
      activities: json['activities'] as String,
      assessment: json['assessment'] as String,
      notes: json['notes'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }

  LessonPlan copyWith({
    String? id,
    String? title,
    String? subject,
    String? grade,
    String? level,
    String? duration,
    String? objectives,
    String? materials,
    String? activities,
    String? assessment,
    String? notes,
    DateTime? createdAt,
  }) {
    return LessonPlan(
      id: id ?? this.id,
      title: title ?? this.title,
      subject: subject ?? this.subject,
      grade: grade ?? this.grade,
      level: level ?? this.level,
      duration: duration ?? this.duration,
      objectives: objectives ?? this.objectives,
      materials: materials ?? this.materials,
      activities: activities ?? this.activities,
      assessment: assessment ?? this.assessment,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}