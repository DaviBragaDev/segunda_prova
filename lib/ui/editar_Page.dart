import 'package:flutter/material.dart';
import 'package:segunda_prova/helpers/usuario_helper.dart';
import 'package:segunda_prova/ui/telaHome_page.dart';


import '../domain/Usuario.dart';

class TelaAltera extends StatelessWidget {
  

  final int idUsuario;
   

  const TelaAltera({
    super.key,
    required this.idUsuario,
  
  });


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Usuario"),
      ),
      body: FormUpdateUsuarioBody(idUsuario:idUsuario),
    );
  }

}


class FormUpdateUsuarioBody extends StatefulWidget {
  
  final int idUsuario;
   

  const FormUpdateUsuarioBody({
    super.key,
    required this.idUsuario,
  
  }); 

  @override
  State<FormUpdateUsuarioBody> createState() => _FormUpdateUsuarioBody();
}

class _FormUpdateUsuarioBody extends State<FormUpdateUsuarioBody> {
  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController nacionalidadeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController racaController = TextEditingController();
  final TextEditingController sexoController = TextEditingController();

  final usuarioHelper = UsuarioHelper();
  
  @override
  void initState() {
    super.initState();
    _loadUsuarioData();
  }

  
  void _loadUsuarioData() async {
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
  Usuario? usuario = await usuarioHelper.getUsuario(widget.idUsuario);
  if (usuario != null) {
    setState(() {
      nomeController.text = usuario.nome;
      nacionalidadeController.text = usuario.nacionalidade;
      idadeController.text = usuario.idade.toString();
      pesoController.text = usuario.peso.toString();
      racaController.text = usuario.raca;
      sexoController.text = usuario.sexo;
    });
  }
}
  


  @override
   Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField("${nomeController.text}", nomeController),
            _buildTextField("${nacionalidadeController.text}", nacionalidadeController),
            _buildTextField("${idadeController.text}", idadeController, TextInputType.number),
            _buildTextField("${pesoController.text}", pesoController, TextInputType.number),
            _buildTextField("${racaController.text}", racaController),
            _buildTextField("${sexoController.text}", sexoController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:  () => _editarUsuario(),
              child: const Text("EDITAR"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller, [TextInputType? keyboardType]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Campo obrigatório';
          }
          return null;
        },
      ),
    );
  }

   _editarUsuario() async {
    print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
    if (_formKey.currentState?.validate() ?? false) {
      Usuario user = Usuario(
        nomeController.text,
        nacionalidadeController.text,
        int.parse(idadeController.text),
        racaController.text,
        int.parse(pesoController.text),
        sexoController.text,
      );
      print(user.nome);
      print(user.nacionalidade);
      print(user.idade);
      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      await usuarioHelper.updateUsuario(user);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('UPDATE realizado com sucesso!'),
        ),
      );

      Navigator.pop(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}

