import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HorseSearchScreen extends StatefulWidget {
  const HorseSearchScreen({super.key});

  @override
  State<HorseSearchScreen> createState() => _HorseSearchScreenState();
}

class _HorseSearchScreenState extends State<HorseSearchScreen> {
  final _horseNameController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _motherNameController = TextEditingController();
  final _ownerNameController = TextEditingController();
  bool _showResults = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('At Sorgula', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildTextField('At Adı', 'At Adı Giriniz', _horseNameController),
                  const SizedBox(height: 16),
                  _buildTextField('Baba Adı', 'Baba Adı Giriniz', _fatherNameController),
                  const SizedBox(height: 16),
                  _buildTextField('Anne Adı', 'Anne Adı Giriniz', _motherNameController),
                  const SizedBox(height: 16),
                  _buildTextField('Sahip Adı', 'Sahip Adı Giriniz', _ownerNameController),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showResults = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text(
                      'Atları Bul',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            if (!_showResults)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Center(
                  child: Text(
                    'Arama sonuçları burada listelenecektir.',
                    style: TextStyle(color: AppTheme.textDark),
                  ),
                ),
              )
            else
              _buildSearchResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
            ),
            filled: true,
            fillColor: isDark ? AppTheme.backgroundDark : AppTheme.surfaceLightMode,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isDark ? AppTheme.border : AppTheme.borderLightMode,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: isDark ? AppTheme.border : AppTheme.borderLightMode,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppTheme.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchResults() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          _buildResultCard('YAMANLARBEYİ', 'Turbo', 'Gülpembe'),
          const SizedBox(height: 12),
          _buildResultCard('CESUR RÜZGAR', 'Sarraf', 'Gökçedil'),
          const SizedBox(height: 12),
          _buildResultCard('SULTANBEYİ', 'Kaizbert', 'Sultan Gelin'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildResultCard(String name, String father, String mother) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/horse-detail');
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.backgroundDark : AppTheme.surfaceLightMode,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isDark ? AppTheme.border : AppTheme.borderLightMode,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Baba: $father - Anne: $mother',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _horseNameController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _ownerNameController.dispose();
    super.dispose();
  }
}
