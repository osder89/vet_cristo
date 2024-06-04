
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:vet_cristo/config/theme/app_theme.dart';
import 'package:vet_cristo/view/Historial.dart';
import 'package:vet_cristo/view/Widget/cardMascotas.dart';
import 'package:vet_cristo/view/Widget/menu_de_navegacion.dart';

class MascotasScreen extends StatefulWidget {
  static const name = '/mascotasScreen';
  @override
  _MascotasScreenState createState() => _MascotasScreenState();
}

class _MascotasScreenState extends State<MascotasScreen> {
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
          'Mis Mascotas',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
       
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    CardMascotas(
                      imagePath: 'assets/facha.png',
                      titulo: 'Coby ',
                      descripcion: "Perro kusky de 2 años de edad",
                      onTap: () {
                        context.push(HistorialScreen.name);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CardMascotas(
                      imagePath: 'assets/facha.png',
                      titulo: 'Mica',
                      descripcion: "Gato de 3 años de edad",
                      onTap: () {
                        context.push(HistorialScreen.name);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CardMascotas(
                      imagePath: 'assets/facha.png',                 
                      titulo: 'Terry ',
                      descripcion: " Gallo de 1 año de edad",
                      onTap: () {
                        context.push(HistorialScreen.name);
                      },
                    ),
                    const SizedBox(
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
