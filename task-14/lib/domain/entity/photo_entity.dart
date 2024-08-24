class PhotoEntity {
  final String name;

  PhotoEntity({required this.name});


  String getPath(){
    return 'https://raw.githubusercontent.com/nik-lazarenko/surf-course/task-14/task-14/assets/images/3_0x/$name';
  }
}