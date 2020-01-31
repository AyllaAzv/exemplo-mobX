import 'package:formulario_mobx/models/client.dart';
import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateNome() == null && validateEmail() == null;
  }

  String validateNome() {
    if (client.nome == null || client.nome.isEmpty) {
      return "Este campo não pode estar vazio.";
    } else if (client.nome.length < 3) {
      return "Seu nome precisa ter mais de 3 caracteres.";
    }
    return null;
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return "Este campo não pode estar vazio.";
    } else if (!client.email.contains("@")) {
      return "Digite um e-mail válido.";
    }
    return null;
  }
}
