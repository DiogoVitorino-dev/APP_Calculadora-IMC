String create_pessoa() {
  return ''' CREATE TABLE pessoa (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    altura REAL,
    peso REAL
  )
''';
}
