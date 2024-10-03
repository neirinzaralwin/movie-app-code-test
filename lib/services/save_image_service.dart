import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_movie_code_test/singeletons/repo_sgl.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class SaveImageService {
  Future<String> saveToDir(String imgUrl, String folderName) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final imageDir = Directory(path.join(appDir.path, folderName));
      if (!imageDir.existsSync()) {
        await imageDir.create(recursive: true);
      }
      final fileName = path.basename(imgUrl);
      final filePath = path.join(imageDir.path, fileName);

      final response =
          await RepoSingeleton.dio!.get(imgUrl, options: Options(responseType: ResponseType.bytes));

      if (response.statusCode == 200) {
        final file = File(filePath);
        await file.writeAsBytes(response.data);
        return file.path;
      } else {
        throw Exception('Failed to download image: $imgUrl');
      }
    } catch (e) {
      throw Exception('Error saving image: $e');
    }
  }

  Future<String> copyAndSaveToDir(String sourcePath, String folderName) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final imageDir = Directory(path.join(appDir.path, folderName));
      if (!imageDir.existsSync()) {
        await imageDir.create(recursive: true);
      }
      final fileName = path.basename(sourcePath);
      final filePath = path.join(imageDir.path, fileName);

      final sourceFile = File(sourcePath);
      final destFile = File(filePath);

      await sourceFile.copy(destFile.path);
      return destFile.path;
    } catch (e) {
      throw Exception('Error saving image: $e');
    }
  }

  Future<void> deleteFileFromDir(String filePath) async {
    try {
      final file = File(filePath);
      if (file.existsSync()) {
        file.deleteSync();
      }
    } catch (e) {
      throw Exception('Error deleting file: $e');
    }
  }

  // Delete all image files from the "popular_images" directory
  Future<void> deleteAllFiles(String folderName) async {
    try {
      final appDir = await getApplicationDocumentsDirectory();
      final dir = Directory(path.join(appDir.path, folderName));

      if (dir.existsSync()) {
        dir.deleteSync(recursive: true);
      }
    } catch (e) {
      throw Exception('Error deleting files: $e');
    }
  }
}
