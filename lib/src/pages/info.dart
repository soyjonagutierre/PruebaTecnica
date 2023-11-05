import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebatecnica/src/models/modelo_personaje.dart';
import 'package:pruebatecnica/src/pages/dashboard.dart';


class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final characterModel = Provider.of<CharacterModel>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 224, 219),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(360), 
                    bottomRight: Radius.circular(360), 
                  ),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      IconButton(
                        iconSize: 30,
                        icon: const Icon(Icons.arrow_back_ios_new_sharp),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Dashboard()),
                            (route) => false,
                          );
                        },
                      ),
                      Expanded(
                        child: Text(
                          characterModel.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 51, 51, 51)
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(8),
              child: 
                Container(
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: 
                    Border.all(
                      color: Colors.white,
                      width: 6, 
                    ),
                    ),
                  child: CircleAvatar(
                            radius: 75,
                            backgroundImage: NetworkImage(characterModel.imagen),
                          ),
                        ),),
              Container(
                padding: const EdgeInsets.all(16),
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(2.0), 
                    1: FlexColumnWidth(3.0), 
                  },
                  defaultColumnWidth: const FlexColumnWidth(1.0),
                  children: [
                    _buildTableRow("Status", characterModel.status),
                    _buildTableRow("Species", characterModel.species),
                    _buildTableRow("Origin", characterModel.origin),
                    _buildTableRow("Location", characterModel.location),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.50,
                child: ClipRRect(
                borderRadius: BorderRadius.circular(25), 
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Dashboard()),
                            (route) => false,
                          );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('DONE'),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(String title, String value) {
  return TableRow(
    children: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          ('$title:'),
          style: const TextStyle(
            color: Color.fromARGB(255, 66, 66, 66),
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 30, 85, 141), 
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    ],
  );
}
}
