import 'package:flutter/material.dart';
import 'package:segunda_prova/domain/Usuario.dart';
import 'package:segunda_prova/helpers/usuario_helper.dart';
import 'package:segunda_prova/ui/cadastrar_Page.dart';
import 'package:segunda_prova/ui/editar_Page.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Meus USERS"),
      ),
      body: HomeBody(),
      //BUTTON DE CADASTRO
      floatingActionButton: FloatingActionButton(   
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CadastroPage(),
            ),
          );
        },
        tooltip: 'Adicionar USER',
        child: Icon(Icons.add),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final usuarioHelper = UsuarioHelper();
  late Future<List> usuarios;

  @override
  void initState() {
    super.initState();
    usuarios = usuarioHelper.getAllUsuarios();
  }

   @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: usuarios,
      builder: (context, snapshot) {
        return snapshot.hasData  ? ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return ListItem(usuario: snapshot.data![i]);
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}







































class ListItem extends StatelessWidget {
  final Usuario usuario;
  const ListItem({Key? key, required this.usuario});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Toque Único"),
        ));
      },
      onLongPress: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaAltera(idUsuario: usuario.id,),
            ),
          );
        
      },
      child: ListTile(
        title: Text(usuario.nome),
        
      ),
    );
  }
}