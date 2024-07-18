import 'package:get/get.dart';
import 'package:aws_sdk/aws_sdk.dart';

class InternetController extends GetxController {
  static InternetController? _instance;
  static InternetController get getInstance =>
      _instance ??= InternetController();

  @override
  Future<void> onInit() async {
    super.onInit();
  }
  var aws = AWS();

  //  final aws = AWS(
  //   region: 'your-aws-region',
  //   accessKey: 'your-access-key',
  //   secretKey: 'your-secret-key',
  // );

  // final s3 = aws.s3('latest');
  // final bucketName = 'your-bucket-name';
  // final key = 'path/to/your/file.txt';
  // final fileContent = 'Hello, S3!';

  // try {
  //   final response = await s3.putObject(
  //     bucket: bucketName,
  //     key: key,
  //     body: fileContent,
  //   );

  //   print('File uploaded successfully! Response: $response');
  // } catch (e) {
  //   print('Error uploading file: $e');
  // }
}
