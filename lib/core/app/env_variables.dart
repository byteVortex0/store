import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariables {
  EnvVariables._();

  String _envType = '';

  static final EnvVariables instance = EnvVariables._();

  Future<void> init({required EnvTypeEnum envTypeEnum}) async {
    switch (envTypeEnum) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
        break;
      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.dev');
        break;
    }

    _envType = dotenv.get('ENV_TYPE');
  }

  String get envType => _envType;
}
