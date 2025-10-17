import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HorseDetailScreen extends StatelessWidget {
  const HorseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('At Detayı', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHorseName(isDark),
              const SizedBox(height: 24),
              _buildIdentitySection(isDark),
              const SizedBox(height: 24),
              _buildStatisticsSection(isDark),
              const SizedBox(height: 24),
              _buildRaceHistorySection(isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorseName(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.surface : AppTheme.backgroundDarkMode,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'GÜZEL KIZ',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: AppTheme.primary,
        ),
      ),
    );
  }

  Widget _buildIdentitySection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Kimlik Bilgileri',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.surface : AppTheme.backgroundDarkMode,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              _buildInfoRow(isDark, 'Yaşı', '4'),
              _buildInfoRow(isDark, 'Cinsiyeti', 'Dişi'),
              _buildInfoRow(isDark, 'Rengi', 'Kır'),
              _buildInfoRow(isDark, 'Baba Adı', 'KAFKASLI'),
              _buildInfoRow(isDark, 'Anne Adı', 'GÜZEL KIZ'),
              _buildInfoRow(isDark, 'Sahibi', 'Ahmet Yılmaz'),
              _buildInfoRow(isDark, 'Antrenörü', 'Mehmet Demir', isLast: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(bool isDark, String label, String value, {bool isLast = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
                ),
              ),
              Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        if (!isLast) Divider(
          color: isDark ? AppTheme.border : AppTheme.borderLightMode,
          height: 1,
        ),
      ],
    );
  }

  Widget _buildStatisticsSection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'İstatistikler',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.5,
          children: [
            _buildStatCard(isDark, 'Toplam Koşu', '12'),
            _buildStatCard(isDark, 'Toplam Kazanç', '₺150K'),
            _buildStatCard(isDark, 'Kazanma %', '25%'),
            _buildStatCard(isDark, 'Tabela Sayısı', '6'),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(bool isDark, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.surface : AppTheme.backgroundDarkMode,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: AppTheme.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildRaceHistorySection(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Geçmiş Koşuları',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildRaceHistoryCard(isDark, '01.05.2024', '1', 'İstanbul', 'Emre Kaya', '55'),
        const SizedBox(height: 12),
        _buildRaceHistoryCard(isDark, '15.04.2024', '2', 'Ankara', 'Can Demir', '54'),
        const SizedBox(height: 12),
        _buildRaceHistoryCard(isDark, '01.04.2024', '3', 'İzmir', 'Deniz Arslan', '56'),
      ],
    );
  }

  Widget _buildRaceHistoryCard(bool isDark, String date, String position, String track, String jockey, String weight) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.surface : AppTheme.backgroundDarkMode,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: position == '1' ? AppTheme.primary : (isDark ? Colors.grey.shade700 : Colors.grey.shade400),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '$position.',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              _buildRaceInfoRow(isDark, 'Hipodrom:', track),
              _buildRaceInfoRow(isDark, 'Jokey:', jockey),
              _buildRaceInfoRow(isDark, 'Kilo:', weight),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRaceInfoRow(bool isDark, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? AppTheme.textLight : AppTheme.textDarkMode,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
            ),
          ),
        ],
      ),
    );
  }
}
