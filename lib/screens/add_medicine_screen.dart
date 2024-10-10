import 'package:flutter/material.dart';
import 'package:medicines_reminder/widgets/custome_textfield.dart';
import '../models/medicine.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _dosage;
  String? _description;
  int? _amount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Add Reminder',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*const Text(
                'Medicine names',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),*/
              CustomeTextField(
                hint: 'Medicine',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a name'
                    : null,
                onSave: (value) => _name = value,
              ),
              const SizedBox(height: 24),
              CustomeTextField(
                hint: 'Dosage',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a dosage'
                    : null,
                onSave: (value) => _dosage = value,
              ),
              const SizedBox(height: 20),
              CustomeTextField(
                hint: 'Amount',
                keyboardType: TextInputType.number,
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter an amount'
                    : null,
                onSave: (value) => _amount = int.parse(value ?? '1'),
              ),
              const SizedBox(height: 20),
              CustomeTextField(
                hint: 'Description',
                validator: (value) => value == null || value.isEmpty
                    ? 'Please enter a description'
                    : null,
                onSave: (value) => _description = value,
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF0ABAB5),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: MaterialButton(
                  height: 48,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(
                        context,
                        Medicine(
                          name: _name!,
                          dosage: _dosage!,
                          amount: _amount!,
                          description: _description!,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
