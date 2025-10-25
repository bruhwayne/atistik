import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../services/tjk_api_service.dart';

class RaceSearchScreen extends StatefulWidget {
  const RaceSearchScreen({super.key});

  @override
  State<RaceSearchScreen> createState() => _RaceSearchScreenState();
}

class _RaceSearchScreenState extends State<RaceSearchScreen> {
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _distanceController = TextEditingController();
  final _fatherNameController = TextEditingController();
  final _motherNameController = TextEditingController();
  
  bool _showResults = false;
  bool _isLoading = false;
  
  String _selectedCity = 'Tümü';
  String _selectedRaceType = 'Tümü';
  
  final List<String> _cities = [
    'Tümü',
    'İstanbul',
    'Ankara',
    'İzmir',
    'Adana',
    'Bursa',
    'Elazığ',
    'Diyarbakır',
    'Şanlıurfa',
  ];
  
  final List<String> _raceTypes = [
    'Tümü',
    'Handikap',
    'Maiden',
    'Grup',
    'Listed',
    'Şartlı',
  ];
  
  List<Map<String, dynamic>> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yarış Sorgula',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
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
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          'Başlangıç Tarihi (İsteğe Bağlı)',
                          'GG.AA.YYYY',
                          _startDateController,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildTextField(
                          'Bitiş Tarihi (İsteğe Bağlı)',
                          'GG.AA.YYYY',
                          _endDateController,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  Row(
                    children: [
                      Expanded(
                        child: _buildDropdown(
                          'Şehir (İsteğe Bağlı)',
                          _selectedCity,
                          _cities,
                          (value) => setState(() => _selectedCity = value!),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildDropdown(
                          'Koşu Cinsi (İsteğe Bağlı)',
                          _selectedRaceType,
                          _raceTypes,
                          (value) => setState(() => _selectedRaceType = value!),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  _buildTextField(
                    'Mesafe (İsteğe Bağlı)',
                    'Örn: 1200',
                    _distanceController,
                  ),
                  const SizedBox(height: 16),
                  
                  _buildTextField(
                    'Baba Adı (İsteğe Bağlı)',
                    'Baba Adı Giriniz',
                    _fatherNameController,
                  ),
                  const SizedBox(height: 16),
                  
                  _buildTextField(
                    'Anne Adı (İsteğe Bağlı)',
                    'Anne Adı Giriniz',
                    _motherNameController,
                  ),
                  const SizedBox(height: 24),
                  
                  ElevatedButton(
                    onPressed: _performSearch,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Yarışları Bul',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            if (_showResults)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Arama Sonuçları',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildSearchResults(),
                  ],
                ),
              ),
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

  Widget _buildDropdown(String label, String value, List<String> items, Function(String?) onChanged) {
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
        DropdownButtonFormField<String>(
          value: value,
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
              borderSide: const BorderSide(color: AppTheme.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }

  void _performSearch() async {
    setState(() {
      _isLoading = true;
      _showResults = true;
      _searchResults = [];
    });
    
    try {
      final result = await TjkApiService.searchRaces(
        startDate: _startDateController.text,
        endDate: _endDateController.text,
        city: _selectedCity == 'Tümü' ? '' : _selectedCity,
        raceType: _selectedRaceType == 'Tümü' ? '' : _selectedRaceType,
        distance: _distanceController.text,
        fatherName: _fatherNameController.text,
        motherName: _motherNameController.text,
      );
      
      if (result['success'] == true) {
        final races = result['races'] as List<dynamic>;
        var filteredRaces = races.map((race) => race as Map<String, dynamic>).toList();
        
        // Client-side filtreleme
        if (_selectedCity != 'Tümü' && _selectedCity.isNotEmpty) {
          filteredRaces = filteredRaces.where((race) {
            final raceCity = (race['city'] as String? ?? '').trim();
            return raceCity.toLowerCase().contains(_selectedCity.toLowerCase());
          }).toList();
        }
        
        if (_selectedRaceType != 'Tümü' && _selectedRaceType.isNotEmpty) {
          filteredRaces = filteredRaces.where((race) {
            final raceType = (race['raceType'] as String? ?? '').trim();
            return raceType.toLowerCase().contains(_selectedRaceType.toLowerCase());
          }).toList();
        }
        
        if (_distanceController.text.isNotEmpty) {
          filteredRaces = filteredRaces.where((race) {
            final distance = (race['distance'] as String? ?? '').trim();
            return distance.contains(_distanceController.text);
          }).toList();
        }
        
        setState(() {
          _searchResults = filteredRaces;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result['error'] ?? 'Bir hata oluştu'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Bağlantı hatası: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildSearchResults() {
    if (_isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              CircularProgressIndicator(color: AppTheme.primary),
              SizedBox(height: 24),
              Text(
                'Yarışlar aranıyor...',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Text(
                'TJK veritabanında arama yapılıyor',
                style: TextStyle(fontSize: 14, color: AppTheme.textDark),
              ),
            ],
          ),
        ),
      );
    }
    
    if (_searchResults.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: [
              Icon(Icons.search_off, size: 64, color: AppTheme.textDark),
              SizedBox(height: 16),
              Text(
                'Sonuç bulunamadı',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              Text(
                'Arama kriterlerinizi değiştirip tekrar deneyin',
                style: TextStyle(fontSize: 14, color: AppTheme.textDark),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }
    
    return Column(
      children: _searchResults.map((race) => _buildRaceCard(race)).toList(),
    );
  }
  
  Widget _buildRaceCard(Map<String, dynamic> race) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${race['city']} - Koşu ${race['raceNumber']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  race['date'] ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildInfoRow('Koşu Cinsi', race['raceType'] ?? ''),
          _buildInfoRow('Mesafe', race['distance'] ?? ''),
          _buildInfoRow('Pist', race['track'] ?? ''),
          _buildInfoRow('Irk', race['breed'] ?? ''),
          _buildInfoRow('Cinsiyet', race['gender'] ?? ''),
        ],
      ),
    );
  }
  
  Widget _buildInfoRow(String label, String value) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    if (value.isEmpty) return const SizedBox.shrink();
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 13,
                color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _distanceController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    super.dispose();
  }
}
