import 'package:flutter/material.dart';

class CardHistorial extends StatelessWidget {
  final String fecha;
  final String hora;
  final String diagnostico;
  final String tratamiento;
  final String motivoConsulta;

  const CardHistorial({
    Key? key,
    required this.fecha,
    required this.hora,
    required this.diagnostico,
    required this.tratamiento,
    required this.motivoConsulta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15.0, bottom: 15.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fecha:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            fecha,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8), // Espacio entre los elementos
          Text(
            'Hora:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            hora,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
           SizedBox(height: 8),
          Text(
            'Motivo de Consulta:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            motivoConsulta,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8), // Espacio entre los elementos
          Text(
            'Diagnóstico:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            diagnostico,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8), // Espacio entre los elementos
          Text(
            'Tratamiento:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            tratamiento,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8), // Espacio entre los elementos
          
        ],
      ),
    );
  }
}
