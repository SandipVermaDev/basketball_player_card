import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerCardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> players;

  const PlayerCardScreen({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[500],
        title: Text(
          'Player Cards',
          style: GoogleFonts.pacifico(fontSize: 26,color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey, Colors.grey[300]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: players.length,
          itemBuilder: (context, index) {
            final player = players[index];
            return Card(
              elevation: 8,
              shadowColor: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(player['image']),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      player['name'],
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      player['position'],
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        color: Colors.grey[700],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                    ),
                    _buildStatRow('Points per Game', player['stats']['pointsPerGame']),
                    _buildStatRow('Assists per Game', player['stats']['assistsPerGame']),
                    _buildStatRow('Rebounds per Game', player['stats']['reboundsPerGame']),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
          ),
          Text(
            value.toString(),
            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
