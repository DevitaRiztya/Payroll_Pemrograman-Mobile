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
  const String usernameBenar = 'admin';
  const String passwordBenar = '12345';
  int percobaan = 0;
  const int batasPercobaan = 3;

  while (percobaan < batasPercobaan) {
    print("|-------------------------------|");
    print("|         LOGIN SYSTEM          |");
    print("|-------------------------------|");
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
      if (sisa . 0) {
        print("[!] Sisa kesempatan mencoba: $sisa kali lagi.\n");
      }
    }
  }

  print("\n[X] Anda telah salah memasukkan login sebanyak $batasPercobaan kali.");
  return false;
}
