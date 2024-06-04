import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vet_cristo/config/theme/app_theme.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CrearCitasScreen extends StatefulWidget {
  static const String name = '/crearCitasScreen';
  const CrearCitasScreen({Key? key}) : super(key: key);

  @override
  _CrearCitasScreenState createState() => _CrearCitasScreenState();
}

class _CrearCitasScreenState extends State<CrearCitasScreen> {
  late DateTime _selectedDate;
  late CalendarFormat _calendarFormat;
  late RangeSelectionMode _rangeSelectionMode;
  final TextEditingController _descriptionController = TextEditingController();
  TimeOfDay _selectedTime = TimeOfDay.now();
  File? _image;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _calendarFormat = CalendarFormat.month;
    _rangeSelectionMode = RangeSelectionMode.toggledOn;
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              'Descripción del problema:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Describe el problema de tu mascota...',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Subir o tomar una foto:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0),
            _image == null
                ? Text('No se ha seleccionado ninguna imagen.')
                : Image.file(_image!),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Tomar Foto',style: TextStyle(color: AppTheme.textColor)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Selecciona el horario:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Seleccionar Horario', style: TextStyle(color: AppTheme.textColor),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Hora seleccionada: ${_selectedTime.format(context)}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Selecciona la fecha:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 10.0),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _selectedDate,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                });
              },
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                _selectedDate = focusedDay;
              },
            ),
            SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Acción para guardar la cita
                },
                child: Text('Guardar Cita',style: TextStyle(color: AppTheme.textColor)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15.0)),
                  minimumSize: MaterialStateProperty.all(Size(300.0, 50.0)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
