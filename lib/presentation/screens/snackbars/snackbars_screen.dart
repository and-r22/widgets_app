import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarsScreen extends StatelessWidget {

  static const name = 'snackbars_screen';
  
  const SnackbarsScreen({super.key});

  void showCustomSnackbar(BuildContext context) {

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'OK', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      snackbar
    );
  }

  void openDiaolg (BuildContext context) {

    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text('Irure enim Lorem veniam fugiat elit cupidatat ullamco nisi labore. Ad veniam mollit cillum sint qui officia exercitation dolor. Quis fugiat laboris fugiat nulla. Laboris cupidatat sit pariatur consectetur pariatur Lorem do incididunt tempor fugiat aute eiusmod. Quis veniam est culpa ex fugiat velit eu laboris cillum nulla et non ipsum. Amet in ipsum irure Lorem aliquip dolor voluptate adipisicing. Duis ullamco aliquip elit anim amet dolore magna tempor qui.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Qui aute minim sunt nisi. Adipisicing ad velit sunt elit sunt dolore in occaecat consectetur pariatur. Pariatur esse nostrud esse irure sit.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),

            FilledButton.tonal(
              onPressed: () => openDiaolg(context), 
              child: const Text('Mostrar dialogo')
            )

          ],
        ),
      ),

      floatingActionButton:  FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context), 
      ),
    );
  }
}