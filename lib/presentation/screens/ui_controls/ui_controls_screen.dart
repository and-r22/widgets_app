import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transport { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {

  bool isDeveloper = true;
  Transport selectedTransport = Transport.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Additional Controls'),
          value: isDeveloper,
          onChanged:
              (value) => setState(() {
                isDeveloper = !isDeveloper;
              }),
        ),

        ExpansionTile(
          title: const Text('Método de transporte'),
          subtitle: Text('$selectedTransport'),
          initiallyExpanded: true,
          children: [
            RadioListTile(
              title: const Text('By Car'),
              subtitle: const Text('Viejar en coche'),
              value: Transport.car,
              groupValue: selectedTransport,
              onChanged:
                  (value) => setState(() {
                    selectedTransport = Transport.car;
                  }),
            ),
            RadioListTile(
              title: const Text('By Plane'),
              subtitle: const Text('Viejar en avión'),
              value: Transport.plane,
              groupValue: selectedTransport,
              onChanged:
                  (value) => setState(() {
                    selectedTransport = Transport.plane;
                  }),
            ),
            RadioListTile(
              title: const Text('By Barco'),
              subtitle: const Text('Viejar en barco'),
              value: Transport.boat,
              groupValue: selectedTransport,
              onChanged:
                  (value) => setState(() {
                    selectedTransport = Transport.boat;
                  }),
            ),
            RadioListTile(
              title: const Text('By Submarine'),
              subtitle: const Text('Viejar en submarino'),
              value: Transport.submarine,
              groupValue: selectedTransport,
              onChanged:
                  (value) => setState(() {
                    selectedTransport = Transport.submarine;
                  }),
            ),
          ],
        ),

        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakfast, 
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          })
        ),
        CheckboxListTile(
          title: const Text('¿Comida?'),
          value: wantsLunch, 
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          })
        ),
        CheckboxListTile(
          title: const Text('¿Cena?'),
          value: wantsDinner, 
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          })
        ),

      ],
    );
  }
}
