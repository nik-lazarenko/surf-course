import '/domain/entity/photo_entity.dart';

class PhotoStateEntity {
  final int index;

  final List<PhotoEntity> photos;

  PhotoStateEntity({required this.index, required this.photos,});
}