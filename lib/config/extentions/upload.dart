import 'dart:io';
import 'package:dio/dio.dart';

extension  on File{

  Future<void> toMultiPart()async=>await MultipartFile.fromFile(path, filename:path.split('/').last);

}