import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Map<String, String>> _userData = [];
  String _nome = '';
  String _email = '';
  String _telefone = '+55';
  String _endereco = '';
  String _genero = 'Masculino';

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _userData.add({
          'nome': _nome,
          'email': _email,
          'telefone': _telefone,
          'endereco': _endereco,
          'genero': _genero,
        });
      });
      _formKey.currentState!.reset();
      _telefone = '+55'; // Reinicia o telefone com +55
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nome'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Esse campo está vazio; é necessário preenchê-lo';
                        }
                        return null;
                      },
                      onSaved: (value) => _nome = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Esse campo está vazio; é necessário preenchê-lo';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Telefone'),
                      initialValue: '+55', // O valor inicial do campo é "+55"
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                        LengthLimitingTextInputFormatter(15),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty || value.length < 4) {
                          return 'Esse campo está vazio; é necessário preenchê-lo';
                        }
                        return null;
                      },
                      onSaved: (value) => _telefone = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Endereço'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Esse campo está vazio; é necessário preenchê-lo';
                        }
                        return null;
                      },
                      onSaved: (value) => _endereco = value!,
                    ),
                    Row(
                      children: [
                        Text('Gênero: '),
                        Expanded(
                          child: RadioListTile(
                            title: Text('Masculino'),
                            value: 'Masculino',
                            groupValue: _genero,
                            onChanged: (value) {
                              setState(() {
                                _genero = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                            title: Text('Feminino'),
                            value: 'Feminino',
                            groupValue: _genero,
                            onChanged: (value) {
                              setState(() {
                                _genero = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _saveForm,
                      child: Text('Salvar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _userData.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(_userData[index]['genero'] == 'Masculino'
                        ? 'assets/homem.png'
                        : 'assets/mulher.png'),
                  ),
                  title: Text(_userData[index]['nome']!),
                  subtitle: Text('${_userData[index]['email']}\n${_userData[index]['telefone']}\n${_userData[index]['endereco']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
