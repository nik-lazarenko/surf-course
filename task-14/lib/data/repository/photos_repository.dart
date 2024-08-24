import '/data/mock_data.dart';
import '/domain/entity/photo_entity.dart';

final class PhotosRepository {

  Future<List<PhotoEntity>> getPosts() async {
    return Future.value(mockData);
  }
}