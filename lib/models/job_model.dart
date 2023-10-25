class JobModel {
  final int id;
  final String? image;
  final String name;
  final String comp_name;
  final String job_time_type;
  final String job_type;
  final String salary;
  final String? job_description;
  final String? job_skill;
  final String? about_comp;
  final String? comp_email;
  final String? comp_website;
   bool isSaved;

  JobModel({
    required this.id,
    this.image,
    required this.name,
    required this.comp_name,
    required this.job_time_type,
    required this.job_type,
    required this.salary,
    this.job_description,
    this.job_skill,
    this.about_comp,
    this.comp_email,
    this.comp_website,
    this.isSaved = false,
  });

  factory JobModel.fromJson(Map<String, dynamic> jsonData) {
    return JobModel(
      id: jsonData['id'],
      name: jsonData['name'],
      image: jsonData['image'],
      comp_name: jsonData['comp_name'],
      salary: jsonData['salary'],
      job_time_type: jsonData['job_time_type'],
      job_type: jsonData['job_type'],
      job_description: jsonData['job_description'],
      job_skill: jsonData['job_skill'],
      about_comp: jsonData['about_comp'],
      comp_email: jsonData['comp_email'],
      comp_website: jsonData['comp_website'],
    );
  }
}
