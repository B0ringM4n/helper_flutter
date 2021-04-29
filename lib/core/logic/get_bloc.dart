import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:helper/core/logic/my_exception.dart';

import 'supervisor.dart';
//our files

/// Clase que se encarga de manejar la logica de negocio
abstract class GetBloc<Event, State> extends GetxController {
  // observdor de cargas
  RxBool _loadStream = false.obs;
  RxBool get loadStream => _loadStream;

  void changeStatusLoad(bool v) {
    _loadStream.value = v;
  }

  void initLoadAnimation() {
    changeStatusLoad(true);
    // Get.dialog(LoadingTonatlan());
  }

  void stopLoadAnimation() {
    if (loadStream.value && Get.isDialogOpen) {
      Get.back();
    }
    changeStatusLoad(false);
  }

  Future<void> onError(String code, String message) async {
    stopLoadAnimation();

    //await Get.dialog(SimpleAlert(message: message));

    if (code == null) return;

    if (code == "440" || code == "401") {
      //Get.offAll(LoginScreen());
      return;
    }
  }

  /// implementacion de los procesos del negocio
  Future<void> mapEvent(Event event);

  /// dispara los eventos y registra logs de los mismos
  Future<void> dispatch(Event event) async {
    try {
      // notifica que el evento inicio
      Supervisor.onEvent(this, event);
      // invoca el mapa de eventos
      await mapEvent(event);
      // finaliza el evento
      Supervisor.onFinaly(this, event);
    } on MyException catch (error) {
      Supervisor.onError(this, error, null);
      onError(error.code, error.message);
    } on PlatformException catch (error, stackTrace) {
      // excepcion para eventos comtrolados
      Supervisor.onError(this, error, stackTrace);
      onError(error.code, error.message);
    } on SocketException catch (error, stackTrace) {
      // excepcion para eventos de conexion
      Supervisor.onError(this, error, stackTrace);
      onError(null, "Error de conexion");
    } catch (error, stackTrace) {
      // excepcion para eventos desconocidos
      Supervisor.onError(this, error, stackTrace);
      onError(null, "error inesperado");
    }
  }

  @override
  void onClose() {
    loadStream?.close();
    super.onClose();
  }
}
