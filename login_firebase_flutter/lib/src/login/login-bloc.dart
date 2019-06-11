import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:login_firebase_flutter/src/services/authentication/Authentication.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:login_firebase_flutter/src/home/home-widget.dart';

class LoginBloc extends BlocBase {
  final _authentication = new Authentication();

  final _phoneController =
      new BehaviorSubject<String>(); // controla o input de texto
  Observable<String> get phoneFlux //<nome do getter
      => _phoneController.stream; // retorno do getter que controla o fluxo
  Sink<String> get phoneEvent //nome do getter de evento
      => _phoneController.sink; // sink adiciona um dado ao evento

  final _smsController = new BehaviorSubject<String>();
  Observable<String> get smsFlux => _smsController.stream;
  Sink<String> get smsEvent => _smsController.sink;

  var _controllerLoading = BehaviorSubject<bool>(seedValue: false);

  Stream<bool> get outLoading => _controllerLoading.stream;

  final BuildContext context;
  LoginBloc(this.context);

  onClickFacebook() {}
  onClickGoogle() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeWidget()));
  }

  onClickTelephone() async {
    _controllerLoading.add(!_controllerLoading.value);

    await _authentication.verifyPhoneNumber(_phoneController.value);

    _controllerLoading.add(!_controllerLoading.value);

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => HomeWidget()));
  }

  @override
  void dispose() {
    // depois de fechar o controller não é mais possivel acessar esse fluxo nem adicionar dados ou eventos
    _controllerLoading.close();
    _phoneController.close();
    _smsController.close();
  }
}
