import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  String nome;
  @observable
  String email;
  @observable
  String cpf;
  
  @action
  mudaNome(String novoNome) => nome = novoNome;

  @action
  mudaEmail(String novoEmail) => email = novoEmail;

  @action
  mudaCpf(String novoCpf) => cpf = novoCpf;
}
