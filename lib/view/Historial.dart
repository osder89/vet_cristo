import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_cristo/config/theme/app_theme.dart';
import 'package:vet_cristo/view/Widget/cardHistorial.dart';
import 'package:vet_cristo/view/Widget/cardMascotas.dart';
import 'package:vet_cristo/view/Widget/menu_de_navegacion.dart';

class HistorialScreen extends StatefulWidget {
  static const name = '/historialScreen';
  @override
  _HistorialScreenState createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 2;

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
      appBar: AppBar(
        backgroundColor: AppTheme.whiteTextColor,
        elevation: 0,
        title: Text(
          'Historial Médico',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     SizedBox(
                      height: 20,
                    ),
                    CardHistorial(
                      fecha: '2022-06-03',
                      hora: '10:00 AM',
                      diagnostico: 'Diagnóstico de la historia clínica',
                      tratamiento: 'Tratamiento de la historia clínica',
                      motivoConsulta:
                          'Motivo de consulta de la historia clínica',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardHistorial(
                      fecha: '2022-06-03',
                      hora: '10:00 AM',
                      diagnostico: 'Diagnóstico de la historia clínica',
                      tratamiento: 'Tratamiento de la historia clínica',
                      motivoConsulta:
                          'Motivo de consulta de la historia clínica',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardHistorial(
                      fecha: '2022-06-03',
                      hora: '10:00 AM',
                      diagnostico: 'Diagnóstico de la historia clínica',
                      tratamiento: 'Tratamiento de la historia clínica',
                      motivoConsulta:
                          'Motivo de consulta de la historia clínica',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CardHistorial(
                      fecha: '2022-06-03',
                      hora: '10:00 AM',
                      diagnostico: 'Diagnóstico de la historia clínica',
                      tratamiento: 'Tratamiento de la historia clínica',
                      motivoConsulta:
                          'Motivo de consulta de la historia clínica',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCard(
      BuildContext context, String image, Widget destinationScreen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationScreen),
        );
      },
      child: AspectRatio(
        aspectRatio: 2.62 / 3,
        child: Container(
          margin: const EdgeInsets.only(right: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: [0.1, 0.9],
                colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
