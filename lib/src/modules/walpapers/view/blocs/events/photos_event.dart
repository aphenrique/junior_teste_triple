abstract class PhotosEvent {}

class FetchPhotosEvent implements PhotosEvent {
  final String? query;
  final int apiPage;
  final int perPage;

  FetchPhotosEvent({this.query, required this.apiPage, required this.perPage});
}
