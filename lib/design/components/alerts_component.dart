import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helper/core/utils/size_util_extension.dart';
//our files

class AlertTonatlan extends StatelessWidget {
  final String title;
  final Widget child;
  final Color color;
  final List<Widget> actions;

  AlertTonatlan({
    Key key,
    this.title = "",
    @required this.child,
    this.actions,
    this.color,
  }) : super(key: key);

  factory AlertTonatlan.simpleMessage(String message) {
    return AlertTonatlan(
      title: "Aviso",
      child: _SipleMessage(message: message),
      actions: [
        Builder(
          builder: (context) => TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Ok"),
          ),
        )
      ],
    );
  }

  factory AlertTonatlan.flowCompleted(String message) {
    return AlertTonatlan(
      title: "",
      child: _Completed(message: message),
      color: Colors.green,
    );
  }

  factory AlertTonatlan.confirm(BuildContext context, String message) {
    return AlertTonatlan(
      title: "Tonatlan",
      child: _ConfirmAlert(message: message),
      actions: [
        TextButton(
          child: Text('No, cancelar'),
          onPressed: () {
            Navigator.pop(context, false);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.red[300]),
        ),
        TextButton(
          child: Text('Si, continuar'),
          onPressed: () {
            Navigator.pop(context, true);
          },
          style: TextButton.styleFrom(backgroundColor: Colors.green[300]),
        ),
      ],
    );
  }

  // InputAlert.password({
  //   Key key,
  //   this.label = "Confirmación con contraseña",
  //   this.hintText = "Contraseña",
  //   this.confidential = true,
  //   this.validator = Validator.validatePassLogin,
  // }) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // contentPadding: EdgeInsets.symmetric(vertical: 3),
      backgroundColor: color,
      //*FORMA DE LA ALERTA
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      //* TITULO DE LA ALERTA
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      //* CONTENIDO
      content: SingleChildScrollView(
        child: child,
      ),
      //*BOTONES DE LA ALERTA
      actions: actions,
    );
  }
}

class _SipleMessage extends StatelessWidget {
  const _SipleMessage({Key key, this.message = ""}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(message),
    );
  }
}

class _ConfirmAlert extends StatelessWidget {
  const _ConfirmAlert({Key key, this.message = ""}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(message),
    );
  }
}

class _Completed extends StatelessWidget {
  const _Completed({
    Key key,
    this.message,
  }) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.hp(40),
      //alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check,
            color: Colors.white,
            size: context.wp(15),
          ),
          SizedBox(height: context.hp(3)),
          Text(
            "¡Listo!",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: context.hp(3)),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: context.hp(5)),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Finalizar",
              style: TextStyle(color: Colors.green),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.white),
          )
        ],
      ),
    );
  }
}
