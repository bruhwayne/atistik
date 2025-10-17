import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RaceSearchScreen extends StatefulWidget {
  const RaceSearchScreen({super.key});

  @override
  State<RaceSearchScreen> createState() => _RaceSearchScreenState();
}

class _RaceSearchScreenState extends State<RaceSearchScreen> {
  final _dateController = TextEditingController();
  final _raceNumberController = TextEditingController();
  String _selectedTrack = 'İstanbul Veliefendi';

  final List<String> _tracks = [
    'İstanbul Veliefendi',
    'Ankara 75. Yıl',
    'İzmir Şirinyer',
    'Adana Yeşiloba',
    'Bursa Osmangazi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text(
          'Atistik',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Yarış Sorgula',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _buildDateField(),
            const SizedBox(height: 16),
            _buildTrackDropdown(),
            const SizedBox(height: 16),
            _buildRaceNumberField(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Koşuları Getir',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Sonuçlar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _buildResults(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tarih Seçin',
          style: TextStyle(
            fontSize: 14,
            color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _dateController,
          decoration: InputDecoration(
            hintText: 'GG.AA.YYYY',
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
              borderSide: const BorderSide(
                color: AppTheme.primary,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTrackDropdown() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hipodrom Seçin',
          style: TextStyle(
            fontSize: 14,
            color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          value: _selectedTrack,
          dropdownColor: isDark ? AppTheme.backgroundDark : AppTheme.surfaceLightMode,
          decoration: InputDecoration(
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
              borderSide: const BorderSide(
                color: AppTheme.primary,
                width: 2,
              ),
            ),
          ),
          items: _tracks.map((track) {
            return DropdownMenuItem(
              value: track,
              child: Text(track),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedTrack = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildRaceNumberField() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Koşu Numarası',
          style: TextStyle(
            fontSize: 14,
            color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: _raceNumberController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Örn: 5',
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
              borderSide: const BorderSide(
                color: AppTheme.primary,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildResults() {
    return Column(
      children: [
        _buildResultCard('İstanbul Veliefendi', 'Koşu 1 - KV-8/Dişi'),
        const SizedBox(height: 12),
        _buildResultCard('Ankara 75. Yıl', 'Koşu 3 - Özel Şartlı 4'),
        const SizedBox(height: 12),
        _buildResultCard('İzmir Şirinyer', 'Koşu 5 - Handikap 15'),
        const SizedBox(height: 12),
        _buildResultCard('Adana Yeşiloba', 'Koşu 2 - A3'),
        const SizedBox(height: 12),
        _buildResultCard('Bursa Osmangazi', 'Koşu 4 - KV-6'),
      ],
    );
  }

  Widget _buildResultCard(String track, String race) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.backgroundDark : AppTheme.backgroundDarkMode,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  track,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  race,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
                  ),
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _raceNumberController.dispose();
    super.dispose();
  }
}
