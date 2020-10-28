import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'welcome': 'Welcome to PWORD',
          'welcome_sub': 'your password manager & generator',
          'generator': 'Generator',
          'safe': 'Safe',
          'settings': 'Settings',
        },
        'pt_BR': {
          'welcome': 'Bem vindo ao PWORD',
          'welcome_sub': 'seu gerador e cofre de senhas',
          'generator': 'Gerador',
          'safe': 'Cofre',
          'settings': 'Ajustes',
        }
      };
}
