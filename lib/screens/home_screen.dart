import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Atistik',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              scaffoldKey.currentState?.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: _buildSettingsDrawer(context, isDark),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Günün Önemli Gelişmeleri',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              _buildImportantRaces(context),
              const SizedBox(height: 32),
              _buildRecentWinners(context),
              const SizedBox(height: 32),
              _buildPopularHorses(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImportantRaces(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bugünkü Önemli Koşular',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildRaceCard(context, 'İstanbul', '7. Koşu - 15:30'),
              _buildRaceCard(context, 'Ankara', '5. Koşu - 14:45'),
              _buildRaceCard(context, 'Adana', '3. Koşu - 13:15'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRaceCard(BuildContext context, String city, String race) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isDark
              ? [Colors.grey.shade800, Colors.grey.shade900]
              : [Colors.grey.shade300, Colors.grey.shade400],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 12,
            left: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  city,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  race,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentWinners(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Son Kazananlar',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildWinnerCard(context, 'Gülbahar', '1. Koşu', '15.000 TL'),
        _buildWinnerCard(context, 'Rüzgarın Kızı', '3. Koşu', '12.500 TL'),
        _buildWinnerCard(context, 'Altın Kalp', '5. Koşu', '18.000 TL'),
      ],
    );
  }

  Widget _buildWinnerCard(
      BuildContext context, String name, String race, String prize) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
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
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                race,
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? AppTheme.textDark : AppTheme.textDarkMode,
                ),
              ),
            ],
          ),
          Text(
            prize,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppTheme.primary),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularHorses(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popüler Atlar',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _buildHorseCard(context, 'Gülbahar', 'Baba: Tamerinoğlu'),
        _buildHorseCard(context, 'Rüzgarın Kızı', 'Baba: Özgünhan'),
        _buildHorseCard(context, 'Altın Kalp', 'Baba: Caş'),
      ],
    );
  }

  Widget _buildHorseCard(BuildContext context, String name, String father) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
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
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                father,
                style: TextStyle(
                  fontSize: 12,
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
    );
  }

  Widget _buildSettingsDrawer(BuildContext context, bool isDark) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ayarlar',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
              title: const Text('Tema'),
              subtitle: Text(isDark ? 'Koyu Tema' : 'Aydınlık Tema'),
              trailing: Switch(
                value: isDark,
                activeColor: AppTheme.primary,
                onChanged: (value) {
                  Navigator.pop(context);
                  HipodromCepteApp.of(context)?.toggleTheme();
                },
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              subtitle: const Text('Yakında eklenecek'),
              trailing: const Icon(Icons.chevron_right),
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
