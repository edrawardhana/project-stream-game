import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.find<HomeController>();
  int _currentIndex = 0; // Untuk menyimpan indeks dari tab yang aktif
  final TextEditingController _searchController =
      TextEditingController(); // Controller untuk TextField
  final ScrollController _scrollController =
      ScrollController(); // Scroll controller untuk mengatur scroll
  String? _selectedCategory; // Menyimpan kategori yang dipilih
  String? _hoveredCategory; // Menyimpan kategori yang sedang di-hover

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Latar belakang gelap untuk dark mode
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background.jpg'), // Ganti dengan nama file gambar latar belakang Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController, // Menghubungkan scroll controller
            child: Column(
              children: [
                // AppBar
                AppBar(
                  backgroundColor:
                      Colors.transparent, // Membuat AppBar transparan
                  elevation: 0, // Menghilangkan bayangan
                  title: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle:
                            TextStyle(color: Colors.white54), // Warna hint
                        filled: false, // Mengatur latar belakang tidak terisi
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide.none, // Menghilangkan garis tepi
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                      ),
                      style: TextStyle(color: Colors.white), // Warna teks
                    ),
                  ),
                  actions: [
                    // Profile Avatar
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/profile.png'), // Ganti dengan gambar profil lokal
                        radius: 20,
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                // Title Categories
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Tab Categories
                Container(
                  height: 40, // Mengatur tinggi untuk membuatnya lebih ramping
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildCategoryChip('Action'),
                      _buildCategoryChip('Shooter'),
                      _buildCategoryChip('MOBA'),
                      _buildCategoryChip('Battle Royale'),
                      _buildCategoryChip('Adventure'),
                      _buildCategoryChip('RPG'),
                    ],
                  ),
                ),
                // Tab Trending Games
                _buildSection(
                  title: 'Trending Games',
                  onSeeAll: () {
                    print('See all trending games clicked');
                  },
                  child: Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildTrendingGameCard('assets/trending_game1.png',
                            'Valorant'), // Ganti dengan gambar lokal
                        _buildTrendingGameCard('assets/trending_game2.png',
                            'Fortnite'), // Ganti dengan gambar lokal
                        _buildTrendingGameCard(
                            'assets/trending_game3.png', 'Dota 2'),
                        _buildTrendingGameCard(
                            'assets/trending_game4.png', 'Forza Horizon'),
                        _buildTrendingGameCard(
                            'assets/trending_game5.png', 'The Crew 2'),
                        _buildTrendingGameCard('assets/trending_game6.png',
                            'Black Dessert Online'), // Ganti dengan gambar lokal
                      ],
                    ),
                  ),
                ),
                // Tab New Games
                _buildSection(
                  title: 'New Games',
                  onSeeAll: () {
                    print('See all new games clicked');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        _buildNewGameCard('Palia', 'assets/new_game1.png',
                            'MMORPG'), // Ganti dengan gambar lokal
                        _buildNewGameCard(
                            'The Last Of Us',
                            'assets/new_game2.png',
                            'Action-adventure'), // Ganti dengan gambar lokal
                        _buildNewGameCard(
                            'Counter Strike 2',
                            'assets/new_game3.png',
                            'FPS'), // Ganti dengan gambar lokal
                        _buildNewGameCard('GTA V', 'assets/new_game4.png',
                            'Action-Adventure'), // Ganti dengan gambar lokal
                        _buildNewGameCard('Minecraft', 'assets/new_game5.png',
                            'Sandbox, Survival'), // Ganti dengan gambar lokal
                        _buildNewGameCard('Brawlhalla', 'assets/new_game6.png',
                            'Fighting'), // Ganti dengan gambar lokal
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar dengan border tumpul
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), // Sudut tumpul kiri atas
          topRight: Radius.circular(20), // Sudut tumpul kanan atas
        ),
        child: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(0, 0, 0, 0),
          elevation: 0, // Warna latar belakang bottom navigation
          currentIndex: _currentIndex, // Indeks saat ini
          selectedItemColor: const Color.fromARGB(255, 10, 206, 216), // Warna item yang dipilih
          unselectedItemColor: Colors.white, // Warna item yang tidak dipilih
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // Ubah ikon dari search menjadi home
              label: 'Home', // Ubah label dari search menjadi home
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Perbarui indeks saat ini
            });
            // Tambahkan navigasi ke halaman lain sesuai kebutuhan
            switch (index) {
              case 0:
                // Halaman Home
                _scrollToSearchField(); // Scroll ke kolom pencarian (misalkan tetap mempertahankan fungsi search)
                break;
              case 1:
                // Halaman Profile
                Get.toNamed('/profile'); // Rute untuk halaman Profile
                break;
            }
          },
        ),
      ),
    );
  }

  // Mengatur scroll ke kolom pencarian
  void _scrollToSearchField() {
    _scrollController.animateTo(
      0, // Scroll ke posisi atas
      duration: Duration(milliseconds: 500), // Durasi animasi
      curve: Curves.easeInOut, // Kurva animasi
    );
  }

  // Widget untuk kategori dengan animasi dan efek hover
  Widget _buildCategoryChip(String category) {
    bool isSelected =
        _selectedCategory == category; // Cek apakah kategori ini dipilih

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _hoveredCategory =
              category; // Menyimpan kategori yang sedang di-hover
        });
      },
      onExit: (_) {
        setState(() {
          _hoveredCategory =
              null; // Menghapus kategori yang di-hover saat keluar
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300), // Durasi animasi
        curve: Curves.easeInOut, // Kurva animasi
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected || _hoveredCategory == category
              ? const Color(0xFFD80A88)
              : Colors.transparent, // Ganti warna jika dipilih atau di-hover
          borderRadius: BorderRadius.circular(20),
          border: isSelected || _hoveredCategory == category
              ? null // Tidak ada border jika dipilih atau di-hover
              : Border.all(
                  color: const Color(0xFFD80A88)), // Border saat tidak dipilih
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            setState(() {
              _selectedCategory = category; // Perbarui kategori yang dipilih
            });
            print('$category clicked');
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: 12, vertical: 8), // Padding untuk kategori
            child: Center(
              child: Text(
                category,
                style: TextStyle(
                  color: isSelected || _hoveredCategory == category
                      ? Colors.white
                      : const Color(0xFFD80A88), // Ubah warna teks
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan bagian Trending atau New Games
  Widget _buildSection(
      {required String title,
      required VoidCallback onSeeAll,
      required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: onSeeAll,
                child: Text('See All', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: 8),
          child, // Konten dari bagian ini (ListView, GridView, dll.)
        ],
      ),
    );
  }

  // Widget untuk kartu game yang sedang trending dengan hover effect
  Widget _buildTrendingGameCard(String imagePath, String gameName) {
    bool isHovered = false; // Untuk melacak apakah kartu di-hover

    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) {
            setState(() {
              isHovered = true; // Aktifkan hover
            });
          },
          onExit: (_) {
            setState(() {
              isHovered = false; // Nonaktifkan hover
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300), // Durasi transisi opacity
              opacity: isHovered ? 1.0 : 0.7, // Ubah opacity saat hover
              child: Container(
                width: 150, // Lebar kartu
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        imagePath), // Gambar game yang sedang trending
                    fit: BoxFit.cover,
                  ),
                  borderRadius:
                      BorderRadius.circular(16), // Radius tumpul untuk gambar
                ),
                child: Container(
                  alignment:
                      Alignment.bottomCenter, // Menempatkan nama game di bawah
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    gameName,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget untuk kartu game baru
  Widget _buildNewGameCard(String gameName, String imagePath, String category) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 120, // Tinggi kartu game baru
        decoration: BoxDecoration(
          color: Colors.white
              .withOpacity(0.1), // Warna latar belakang dengan transparansi
          borderRadius: BorderRadius.circular(16), // Radius tumpul untuk kartu
        ),
        child: Row(
          children: [
            // Gambar game
            Container(
              width: 120, // Lebar gambar game
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath), // Gambar game baru
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Nama dan kategori game
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      gameName,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      category,
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
