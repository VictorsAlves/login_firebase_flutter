import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'login-bloc.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        bloc: LoginBloc(context),
        child: Material(
            child: Stack(fit: StackFit.expand, children: <Widget>[
          //Image.network('https://i.pinimg.com/originals/7a/c7/21/7ac7218b398ee2a9430ab9a78e32c0a7.jpg',fit: BoxFit.cover ),
          Image.asset('assets/tevitekiss-bg.jpg', fit: BoxFit.cover),
          Container(
            color: Colors.green.withOpacity(0.4),
          ),

          SingleChildScrollView(child: _LoginContent()),
        ])));
  }
}

class _LoginContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
    _butons() {
      return Column(
        children: <Widget>[
          RaisedButton.icon(
            textColor: Colors.white,
            color: Colors.green,
            icon: Icon(Icons.phone),
            label: Text("Login Com Telefone"),
            onPressed: bloc.onClickTelephone,
          ),
          RaisedButton.icon(
            textColor: Colors.white,
            color: Colors.red,
            icon: Icon(FontAwesomeIcons.google),
            label: Text("Login Com Google "),
            onPressed: bloc.onClickGoogle,
          ),
          RaisedButton.icon(
            textColor: Colors.white,
            color: Colors.blue,
            icon: Icon(FontAwesomeIcons.facebookF),
            label: Text("Login Com Facebook"),
            onPressed: bloc.onClickFacebook,
          )
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlutterLogo(
          size: 71,
        ),
        Container(
          height: 121,
        ),
        StreamBuilder(
          stream: bloc.outLoading,
          initialData: false,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            return AnimatedCrossFade(
              firstChild: _butons(),
              secondChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
              duration: Duration(microseconds: 500),
              crossFadeState: snapshot.data
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            );
          },
        ),
        TextField(
          onChanged: bloc.phoneEvent.add,
          onSubmitted: (String value) => bloc.onClickTelephone(),
        ),
      ],
    );
  }
}
