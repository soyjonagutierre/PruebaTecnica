import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pruebatecnica/src/models/modelo_personaje.dart';
import 'package:pruebatecnica/src/models/modelo_usuario.dart';
import 'package:pruebatecnica/src/pages/info.dart';
import 'package:pruebatecnica/src/pages/inicio.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> personajes = [];

  @override
  void initState() {
    super.initState();
    fetchData(); // Llama a la función para obtener los datos de la API
  }

  @override
  Widget build(BuildContext context) {
    final userName = Provider.of<UserModel>(context).name;
    final characterModel = Provider.of<CharacterModel>(context, listen: false);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.green,
      statusBarIconBrightness: Brightness.light,
    ));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 224, 219),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'WELCOME ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 75, 77, 79),
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 30, 85, 141),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    iconSize: 30,
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () {
                      Provider.of<UserModel>(context, listen: false).setName('');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Inicio()),
                        (route) => false,
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text('GET INFORMATION ABOUT RICK AND MORTY CHARACTERS',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: personajes.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomExpansionTile(
                        title: personajes[index]['name'],
                        imagen: personajes[index]['image'],
                        status: personajes[index]['status'],
                        especie: personajes[index]['species'],
                        locacion: personajes[index]['location']['name'],
                        origin: personajes[index]['origin']['name'],
                        characterModel: characterModel,
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    try {
      final data = await Provider.of<UserModel>(context, listen: false).apiService.fetchData();
      
      setState(() {
        personajes = data['results']; 
      });
    } catch (e) {
      print('Error en la api: $e');
    }
  }
}

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final String imagen;
  final String status;
  final String especie;
  final String locacion;
  final String origin;
  final CharacterModel characterModel;
  CustomExpansionTile({
    required this.title,
    required this.imagen,
    required this.status,
    required this.especie,
    required this.locacion,
    required this.origin,
    required this.characterModel,
  });

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState(characterModel: characterModel); 
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;
   final CharacterModel characterModel;
  _CustomExpansionTileState({required this.characterModel}) : super();  

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey, 
                        offset: Offset(90, 7), 
                        blurRadius: 26, 
                        spreadRadius: 90,
                      )
                    ]
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      setState(() {
                        isExpanded = value;
                      });
                    },
                    title: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 3, 
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage(widget.imagen),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(widget.title,
                        style: TextStyle(
                           color: isExpanded ? Colors.white : Colors.black,
                           fontSize: 18,
                           fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    maintainState: true,
                    backgroundColor: const Color.fromARGB(255, 12, 99, 117),
                    collapsedBackgroundColor: Colors.green,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    collapsedShape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(23))),
                    children: [
                      Text('Status: ${widget.status}',
                      style: TextStyle(color: isExpanded ? Colors.white : Colors.black, fontSize: 17),),
                      Text('Species: ${widget.especie}',
                      style: TextStyle(color: isExpanded ? Colors.white : Colors.black, fontSize: 17),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.55,
                          height: 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25), 
                            child: ElevatedButton(
                              onPressed: () {
                                characterModel.updateCharacter(
                                  widget.title,
                                  widget.status,
                                  widget.especie,
                                  widget.origin,
                                  widget.imagen,
                                  widget.locacion,
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => InfoPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 185, 232, 29), 
                              ),
                              child: const Text('MORE INFO', style: TextStyle(color: Color.fromARGB(255, 83, 83, 83)),),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
  }
}
