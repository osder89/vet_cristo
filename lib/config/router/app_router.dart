
import 'package:go_router/go_router.dart';
import 'package:vet_cristo/view/CitasScrenn.dart';
import 'package:vet_cristo/view/Historial.dart';
import 'package:vet_cristo/view/MascotasScreen.dart';
import 'package:vet_cristo/view/HomeScreen.dart';
import 'package:vet_cristo/view/Inicio.dart';
import 'package:vet_cristo/view/PerfilScreen.dart';
import 'package:vet_cristo/view/CrearCita.dart';


final appRouter = GoRouter(initialLocation: '/', routes: [
 
  GoRoute(
    path: '/',
    name: LoginScreen.name,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/homeScreen',
    name: HomeScreen.name,
    builder: (context, state) => HomeScreen(),
  ),
  GoRoute(
    path: '/perfilScreen',
    name: PerfilScreen.name,
    builder: (context, state) => PerfilScreen(),
  ),
  GoRoute(
    path: '/mascotasScreen',
    name: MascotasScreen.name,
    builder: (context, state) => MascotasScreen(),
  ),
  GoRoute(
    path: '/historialScreen',
    name: HistorialScreen.name,
    builder: (context, state) => HistorialScreen(),
  ),
   GoRoute(
    path: '/citasScreen',
    name: CitasScreen.name,
    builder: (context, state) => CitasScreen(),
  ),
  GoRoute(
    path: '/crearCitasScreen',
    name: CrearCitasScreen.name,
    builder: (context, state) => CrearCitasScreen(),
  ),
   
]);
