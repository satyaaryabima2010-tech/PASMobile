
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_flutter/controller/feat_controller.dart';


class BolaPage extends StatelessWidget {
  BolaPage({super.key});

  final FeatController controller = Get.put(FeatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tim Sepak Bola'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.daftarBola.isEmpty) {
          return const Center(
            child: Text('Data tim tidak ditemukan'),
          );
        }

        return ListView.builder(
          itemCount: controller.daftarBola.length,
          itemBuilder: (context, index) {
            final tim = controller.daftarBola[index];

            return Card(
              margin: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),

              
child: ListTile(
  leading: tim['strBadge'] != null
      ? Image.network(
          tim['strBadge']!,
          width: 50,
          height: 50,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(
              Icons.sports_soccer,
              size: 40,
            );
          },
        )
      : const Icon(
          Icons.sports_soccer,
          size: 40,
        ),

  title: Text(
    tim['strTeam'] ?? 'Nama tim tidak tersedia',
    style: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),

  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Liga: ${tim['strLeague'] ?? '-'}'),
      Text('Negara: ${tim['strCountry'] ?? '-'}'),
      Text('Stadion: ${tim['strStadium'] ?? '-'}'),
    ],
  ),

  trailing: const Icon(Icons.arrow_forward_ios),
),

            );
          },
        );
      }),
    );
  }
}
