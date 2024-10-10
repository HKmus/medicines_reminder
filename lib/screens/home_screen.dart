// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

import '../models/medicine.dart'; // Import your Medicine model
import '../widgets/medicine_card.dart'; // Import the MedicineCard widget
import '../screens/add_medicine_screen.dart'; // Import screen to add new medicine

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // This would typically come from a database or a service.
  List<Medicine> medicines = [
    Medicine(
      name: 'Paracetamol',
      dosage: '500mg',
      amount: 2,
      description: 'Before lunch',
    ),
    Medicine(
      name: 'Ibuprofen',
      dosage: '200mg',
      amount: 1,
      description: 'After meal',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 51,
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: SizedBox(
                  height: 51,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hi, Mustapha',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Saturday, 05 October',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.notifications_none_rounded,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Todays medicine',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: medicines.isEmpty
                  ? const Center(
                      child: Text('No medicines yet, add some!'),
                    )
                  : ListView.builder(
                      itemCount: medicines.length,
                      itemBuilder: (context, index) {
                        final medicine = medicines[index];
                        return MedicineCard(medicine: medicine);
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0ABAB5),
        onPressed: () {
          // Navigate to the add medicine screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMedicineScreen()),
          ).then((newMedicine) {
            if (newMedicine != null) {
              setState(() {
                medicines.add(newMedicine);
              });
            }
          });
        },
        tooltip: 'Add Reminders',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
