import 'package:equatable/equatable.dart';

List<SubjectModel> get subjectsList => const <SubjectModel>[
      SubjectModel(id: 1, name: 'الرياضيات'),
      SubjectModel(id: 2, name: 'اللغة العربية'),
      SubjectModel(id: 3, name: 'اللغة الانجليزية'),
      SubjectModel(id: 4, name: 'العلوم'),
      SubjectModel(id: 5, name: 'التربية الاسلامية'),
      SubjectModel(id: 6, name: 'التربية الوطنية'),
      SubjectModel(id: 7, name: 'التربية الفنية'),
      SubjectModel(id: 8, name: 'التربية المهنية'),
      SubjectModel(id: 9, name: 'التربية البدنية'),
      SubjectModel(id: 10, name: 'التربية الاجتماعية'),
    ];

class SubjectModel extends Equatable {
  final int id;
  final String name;

  const SubjectModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
