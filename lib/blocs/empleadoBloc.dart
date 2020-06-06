/*
1. Imports
2. Lista de empleados
3. Stream Controller
4. Stream Sink Getter
5. Constructor - añadir data, escuchar cambios
6. Funciones Principales
7. dispose
*/

import 'dart:async';
import 'package:FlutterBLoC/models/empleado.dart';

class EmpleadoBloc {
  List<Empleado> _empleadosList = [
    Empleado(1, "Empleado 1", 450.0),
    Empleado(2, "Empleado 2", 550.0),
    Empleado(3, "Empleado 3", 650.0),
    Empleado(4, "Empleado 4", 750.0),
    Empleado(5, "Empleado 5", 850.0),
    Empleado(6, "Empleado 6", 950.0),
    Empleado(7, "Empleado 7", 150.0),
    Empleado(8, "Empleado 8", 250.0),
    Empleado(9, "Empleado 9", 350.0),
    Empleado(10, "Empleado 10", 1050.0),
    Empleado(11, "Empleado 11", 1150.0),
  ];

  //Definiendo Stream Controller
  
  //Stream Controller para mostrar la lista de empleados
  final _empleadoListStreamController = StreamController<List<Empleado>>();

  //Stream Controller para aumentar salario
  final _empleadoSalarioIncrementStreamController = StreamController<Empleado>();

  //Stream controller para decrementar salario
  final _empleadoSalarioDecrementStreamController = StreamController<Empleado>();

  //Getter : streams
  /*
  La estructura de un Getter esta conformada por:
  1. Tipo de Dato del getter (stream en este caso; el stream será responsable de manejar la lista y la lista contiene la data del empleado)
  2. Le damos un Keyword "get".
  3. Le ponemos el nombre del getter
  4. El return: queremos que retorne en este caso un stream de _empleadoListStreamController
  */

  //Los que estamos haciendo es crear un objeto de StreamController y tratando de controllar este stream y sink 
  Stream <List<Empleado>> get empleadoListStream => _empleadoListStreamController.stream;
  StreamSink <List<Empleado>> get empleadoListSink => _empleadoListStreamController.sink;

  //Getters para incrementador y decrementador de salario

  //Incrementador
  StreamSink <Empleado> get empleadoSalarioIncrement => _empleadoSalarioIncrementStreamController.sink;

  //Decrementador 
  StreamSink <Empleado> get empleadoSalarioDecrement => _empleadoSalarioDecrementStreamController.sink;

  //Constructor para añadir data y escuchar los cambios
  EmpleadoBloc(){
    _empleadoListStreamController.add(_empleadosList);
    _empleadoSalarioIncrementStreamController.stream.listen(_incrementSalario);
    _empleadoSalarioDecrementStreamController.stream.listen(_decrementSalario);
  }

  //Logica de negocio o funciones principales (core functions)
  _incrementSalario(Empleado empleado){
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20/100;

    _empleadosList[empleado.id - 1].salario = salarioActual + salarioIncrement;
    empleadoListSink.add(_empleadosList);
  }

  _decrementSalario(Empleado empleado){
    double salarioActual = empleado.salario;
    double salarioIncrement = salarioActual * 20/100;

    _empleadosList[empleado.id - 1].salario = salarioActual - salarioIncrement;
    empleadoListSink.add(_empleadosList);
  }

  //dispose para liberar los recursos que son utilizados por los streams
  //dispose es un metodo que se tiene que sobreescribir ya que existe por default 
  void dispose(){
    _empleadoListStreamController.close();
    _empleadoSalarioIncrementStreamController.close();
    _empleadoSalarioDecrementStreamController.close();
  }
  

}