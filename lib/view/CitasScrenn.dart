import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_cristo/config/theme/app_theme.dart';
import 'package:vet_cristo/view/CrearCita.dart';
import 'package:vet_cristo/view/Widget/menu_de_navegacion.dart'; // Asegúrate de importar la pantalla de creación de citas

class CitasScreen extends StatefulWidget {
  static const name = '/citasScreen';
  const CitasScreen({Key? key}) : super(key: key);

  @override
  State<CitasScreen> createState() => _CitasScreenState();
}

class _CitasScreenState extends State<CitasScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MenuDeNavegacion(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      appBar: AppBar(
        title: Text('Mis Citas',
            style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        //backgroundColor: AppTheme.primaryColor,
        actions: [
          TextButton(
            onPressed: () {
              context.push(CrearCitasScreen.name);
            },
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  color: AppTheme.primaryColor,
                ), // Icono de suma
                SizedBox(width: 8), // Espacio entre el icono y el texto
                Text(
                  'Crear',
                  style: TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ), // Texto "Crear"
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(height: 20.0),
            buildCitaItem('2024-06-10', '09:00 AM', 'Revisión anual',
                'Revisar la salud de mi mascota'),
            SizedBox(height: 20.0),
            buildCitaItem('2024-06-15', '10:30 AM', 'Vacunación',
                'Vacunar a mi mascota contra la rabia'),
            SizedBox(height: 20.0),
            buildCitaItem('2024-06-20', '03:15 PM', 'Corte de pelo',
                'Hacer un corte de pelo para mi mascota'),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  Widget buildCitaItem(
      String fecha, String hora, String titulo, String descripcion) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        title: Text(
          titulo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Text(
              'Fecha: $fecha',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'Hora: $hora',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              'Descripción: $descripcion',
            ),
          ],
        ),
        onTap: () {
          // Acción al hacer clic en la cita
        },
      ),
    );
  }
}
