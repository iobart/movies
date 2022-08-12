import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';
import 'package:movies/src/app/utils/image_path_generator.dart';

class MoviesImage extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  final ImageSize imageSize;

  const MoviesImage({
    Key? key,
    required this.width,
    required this.height,
    this.imageSize = ImageSize.w500,
    this.imagePath = '/7q448EVOnuE3gVAx24krzO7SNXM.jpg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        setImagePathIntoUrl(imagePath, imageSize: ImageSize.w500),
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (_, child, progress) {
          return progress == null
              ? child
              :  Center(
                  child: CircularProgressIndicator(
                    color: yellowColor,
                  ),
                );
        },
      ),
    );
  }
}
