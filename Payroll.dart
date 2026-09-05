import 'dart:io';

void main() {
  tampilkanSelamatDatang();

  //1. Proses Login
  bool loginBerhasil = prosesLogin();

  if (loginBerhasil) {
    jalankanMenuUtama();
  } else {
    print("\n[!] Program dihentikan karena login gagal.");
  }
}

bool prosesLogin() {
  const String usernameBenar = "admin";
  const String passwordBenar = "12345";
  int percobaan = 0;
  const int batasPercobaan = 3;

  while (percobaan < batasPercobaan) {
    print("|---------------------------------|");
    print("|         HALAMAN SYSTEM          |");
    print("|---------------------------------|");
    stdout.write(" Masukkan Username : ");
    String? rawUser = stdin.readLineSync();
    if (rawUser == null) exit(0);
    String usernameInput = rawUser.replaceFirst('\uFEFF', '').trim();

    stdout.write(" Masukkan Password : ");
    String passwordInput = bacaPassword().replaceFirst('\uFEFF', '').trim();

    if (usernameInput == usernameBenar && passwordInput == passwordBenar) {
      print("\n[+] Login berhasil! Selamat datang, $usernameInput.");
      jedaEnter();
      return true;
    } else {
      percobaan++;
      int sisa = batasPercobaan - percobaan;
      print("\n[X] Username atau password salah.");
      if (sisa > 0) {
        print("[!] Sisa kesempatan mencoba: $sisa kali lagi.\n");
      }
    }
  }

  print("\n[X] Anda telah salah memasukkan login sebanyak $batasPercobaan kali.");
  return false;
}

String bacaPassword() {
  if (!stdin.hasTerminal) {
    String? raw = stdin.readLineSync();
    if (raw == null) exit(0);
    return raw.replaceFirst('\uFEFF', '').trim();
  }

  List<int> chars = [];
  try {
    stdin.echoMode = false;
    stdin.lineMode = false;

    while (true) {
      int byte = stdin.readByteSync();

      if (byte == 10 || byte == 13) {
        print("");
        break;
      }
      if (byte == 8 || == 127) {
        if (chars.isNotEmpty) {
          chars.removeLast();
          stdout.write('\b \b');
        }
      } else if (byte >= 32 && byte <= 126) {
        chars.add(byte);
        stdout.write('*');
      }
    }
  } catch (_) {
    String? raw = stdin.readLineSync();
    if (raw == null) exit(0);
    return raw.replaceFirst('\uFEFF', '').trim();
  } finally {
    try {
      stdin.lineMode = true;
      stdin.echoMode = true;
    } catch (_) {}
  }

  return String.fromCharCodes(chars).trim();
}

void jalankanMenuUtama() {
  bool tetapBerjalan = true;

  while (tetapBerjalan) {
    tampilkanHeaderDashboard();
    print(" [1] Data Kelompo");
    print(" [2] Perencanaan Gaji (Penjumlahan, Pengurangan, Perkalian, Pembagian)");
    print(" [3] Cek Hari Lembur (Ganjil / Genap & Kebijakan Startup)");
    print(" [4] Total Biaya Penggajian (Penjumlahan Total Tim)");
    print(" [5] Logout & Keluar");
    print("______________________________________________________________");
    stdout.write(" Pilih menu [1 - 5]: ");
    String? rawPilihan = stdin.readLineSync();
    if (rawPilihan == null) exit (0);
    String pilihan = rawPilihan.trim();

    switch (pilihan) {
      case '1':
        menuDataKelompok();
        break;
      case '2':
        menuPerencanaanGaji();
        break;
      case '3':
        menuCekHariLembur();
        break;
      case '4':
        menuTotalBiayaPenggajian();
        break;
      case '5':
        print("\n[!] Anda berhasil logout dari sistem. Sampai jumpa!");
        tetapBerjalan = false;
        break;
      default:
        print("\n[!] Pilihan tidak valid. Silahkan pilih angka 1 sampai 5.");
        jedaEnter();
    }
  }
}

void tampilkanSelamatDatang() {
  print("\n");
  print("================================================");
  print("||               SELAMAT DATANG               ||");
  print("||        SISTEM PERENCANAAN PENGGAJIAN       ||");
}

void tampilkanSElamatDatang() {
  print("\n");
  print("================================================");
  print("||               PAYROLL PLANNER              ||");
  print('||        SISTEM PERENCANAAN PENGGAJIAN       ||');
}

void menuDataKelompok() {
  print("\n|---------------------------------|");
  print("|          DATA KELOMPOK            |");
  print("\n|---------------------------------|");

  String namakelompok = "Kelompok";
  List<Map<String, String>> anggota = [
    {"nama": "Fania Azelia", "NIM": "124240161"},
    {"nama": "Azzahrah Zakiyah N.F", "NIM": "124240171"},
    {"nama": "Devita Riztya N.P", "NIM": "124240176"},
  ];

  print(" Nama Kelompok: $namakelompok\n");
  print(" Daftar Anggota:");
  print("------------------------------------------------");
  print("| No |        Nama Anggota        |    NIM    |");
  print("------------------------------------------------");
  for (int i = 0; i < anggota.length; i++) {
    String nama = anggota[i]["nama"]!.padRight(28);
    String nim = anggota[i]["NIM"]!;
    print(" $no$nama$nim");
  }
  print("------------------------------------------------");

  jedaEnter();
  }