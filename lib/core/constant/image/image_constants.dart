class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  String get corporateIcon => toPng("splash");

  String toPng(String name) => "asset/image/$name.png";
}
