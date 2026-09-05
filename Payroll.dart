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

  while (percobaan < batarPercobaan) {
    print("|-------------------------------|");
    print("|         LOGIN SYSTEM          |");
    print("|-------------------------------|");
    
  }
}