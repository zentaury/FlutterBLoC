class Empleado {
  int _id;
  String _nombre;
  double _salario;

  //Constructor
  Empleado(this._id, this._nombre, this._salario);

  //Setters
  set id(int id){
    this._id = id;
  }

  set nombre(String nombre){
    this._nombre = nombre;
  }

  set salario(double salario){
    this._salario = salario;
  }

  //Getters
  int get id => this._id;
  String get nombre => this._nombre;
  double get salario => this._salario;

}