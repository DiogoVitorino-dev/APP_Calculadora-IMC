class PessoaModelDB {
  int _id = 0;
  String _nome = "";
  double _altura = 0;
  double _peso = 0;

  PessoaModelDB.create(this._nome, this._altura, this._peso);
  
  PessoaModelDB(this._id,this._nome, this._altura, this._peso);

  set id(int id) => _id = id;
  set nome(String nome) => _nome = nome;
  set altura(double altura) => _altura = altura;
  set peso(double peso) => _peso = peso;

  String get nome => _nome;
  double get altura => _altura;
  double get peso => _peso;
  int get id => _id;
}