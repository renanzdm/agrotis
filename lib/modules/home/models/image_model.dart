class ImageModel {
  final String imageMediumQuality;
  final String imageLargeQuality;
  ImageModel({
    this.imageMediumQuality = '',
    this.imageLargeQuality = '',
  });

  ImageModel copyWith({
    String? imageMediumQuality,
    String? imageLargeQuality,
  }) {
    return ImageModel(
      imageMediumQuality: imageMediumQuality ?? this.imageMediumQuality,
      imageLargeQuality: imageLargeQuality ?? this.imageLargeQuality,
    );
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      imageMediumQuality: (map['medium'] ?? '') as String,
      imageLargeQuality: (map['large'] ?? '') as String,
    );
  }
}
