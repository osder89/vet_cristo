import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vet_cristo/config/theme/app_theme.dart';
import 'package:vet_cristo/view/CrearCita.dart';
import 'package:vet_cristo/view/Widget/cardServicios.dart';
import 'package:vet_cristo/view/Widget/menu_de_navegacion.dart';

class HomeScreen extends StatefulWidget {
  static const name = '/homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> servicios = [
    {
      'title': 'Servicio 1',
      'description': 'Descripción 1',
      'price': '\$20',
      'imagePath': 'assets/facha.png'
    },
    {
      'title': 'Servicio 2',
      'description': 'Descripción 2',
      'price': '\$30',
      'imagePath': 'assets/facha.png'
    },
    {
      'title': 'Servicio 3',
      'description': 'Descripción 3',
      'price': '\$25',
      'imagePath': 'assets/facha.png'
    },
  ];
  Future<List<dynamic>> _fetchCategorias() async {
    final response = await http
        .get(Uri.parse('https://eeb2-189-28-69-140.ngrok-free.app/categoria'));
    if (response.statusCode == 200) {
      print(json.decode(response.body)['data']);
      return json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load categorias');
    }
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      bottomNavigationBar: MenuDeNavegacion(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Te damos la bienvenida a',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'erinaria el  Cristo',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset(
                        'assets/facha.png',
                        width: 100.0,
                        height: 70.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.thirtyColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Consulta Veterinaria',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Agenda una consulta para tu mascota facil y rapido',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  context.push(CrearCitasScreen.name);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primaryColor,
                                ),
                                child: Text(
                                  'Agendar',
                                  style: TextStyle(color: AppTheme.textColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/facha.png',
                            width: 120,
                            height: 130,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Servicios',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  CardServicios(
                    title: 'Servicio 1',
                    price: '\$20',
                    imagePath: 'assets/facha.png',
                  ),
                  CardServicios(
                    title: 'Servicio 2',
                    price: '\$30',
                    imagePath: 'assets/facha.png',
                  ),
                  CardServicios(
                    title: 'Servicio 3',
                    price: '\$25',
                    imagePath: 'assets/facha.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
