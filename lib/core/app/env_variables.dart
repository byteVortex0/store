import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { prod, dev }

class EnvVariables {
  EnvVariables._();

  static final EnvVariables instance = EnvVariables._();

  String _envType = '';
  String _notificationBaseUrl = '';
  String _privateKey = '';

  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
        break;
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.prod');
        break;
    }
    _envType = dotenv.get('ENV_TYPE');
    _notificationBaseUrl = dotenv.get('NOTIFICATION_BASE_URL');
    _privateKey = dotenv.get('PRIVATE_KEY');
  }

  String get envType => _envType;
  String get notificationBaseUrl => _notificationBaseUrl;
  String get privateKey => _privateKey;
}
