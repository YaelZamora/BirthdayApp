import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nombre = TextEditingController();
  String saludo = "";
  String language = 'es-MX';
  bool show = false;

  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feliz Cumpleaños"),
      ),
      body: Stack(
        children: [
          (show) ? Column(
            children: [
              const Spacer(),
              Lottie.asset('assets/pastel.json'),
              const Spacer(),
            ],
          ) : Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: nombre,
                  decoration: const InputDecoration(
                    hintText: 'Nombre del festejado'
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    saludo = "Feliz cumpleaños, ${nombre.text}";
                    show = true;
                  });
                  flutterTts.speak(saludo);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Aceptar"),
              ),
              Text(
                saludo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
          (show) ? Column(
            children: [
              const Spacer(),
              Lottie.asset('assets/confeti.json'),
              const Spacer(),
            ],
          ) : const Spacer(),
        ],
      ),
    );
  }
}
