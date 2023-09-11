import 'package:YukCamping/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  SharedPreferences? preferences;

  Future<void> getDataPre() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? namePre = preferences.getString('name');
    String? emailPre = preferences.getString('email');
    String? photoPre = preferences.getString('photoUrl');
    print('Name from SharedPreferences: $namePre + $emailPre + $photoPre');

    if (namePre != null && emailPre != null) {
      userName.value = namePre;
      userEmail.value = emailPre;
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  // Variabel untuk menyimpan email pengguna
  var userEmail = ''.obs;

  // Variabel untuk menyimpan nama pengguna
  var userName = ''.obs;

  // Variabel untuk menyimpan photo pengguna
  var userPhotoUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    initPreferences();
    getDataPre();
  }

  void initPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  Stream<User?> streamAuthStatus() {
    return auth.authStateChanges();
  }

  void login(
      String email, String password, Function(bool) onLoginResult) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Mengambil data pengguna setelah berhasil login
      User? user = userCredential.user;
      if (user != null) {
        userEmail.value = user.email ?? '';
        userName.value = user.displayName ?? '';
        userPhotoUrl.value = user.photoURL ?? '';

        // Simpan Data
        preferences?.setString('email', user.email ?? '');
        preferences?.setString('name', user.displayName ?? '');

        // Berhasil login, panggil callback dengan nilai true
        onLoginResult(true);
      } else {
        // Gagal login, panggil callback dengan nilai false
        onLoginResult(false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
            'Validasi Gagal', 'Email Tidak Ditemukan, Daftar Sekarang!',
            snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Validasi Gagal', 'Password Salah',
            snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
      }

      // Gagal login, panggil callback dengan nilai false
      onLoginResult(false);
    }
  }

  // void login(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);

  //     // Mengambil data pengguna setelah berhasil login
  //     User? user = userCredential.user;
  //     if (user != null) {
  //       userEmail.value = user.email ?? '';
  //       userName.value = user.displayName ?? '';
  //       userPhotoUrl.value = user.photoURL ?? '';

  //       // Simpan Data
  //       preferences?.setString('email', user.email ?? '');
  //       preferences?.setString('name', user.displayName ?? '');
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       Get.snackbar(
  //           'Validation Failed', 'Your Email Not Found, Register Now !',
  //           snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
  //     } else if (e.code == 'wrong-password') {
  //       Get.snackbar('Validation Failed', 'Your Password Wrong',
  //           snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
  //     }
  //   }
  // }

  void logout() async {
    preferences?.remove('email');
    preferences?.remove('name');
    preferences?.remove('photoUrl');

    await FirebaseAuth.instance.signOut();

    Get.offAndToNamed(AppRoutes.login);
  }

  void register(String email, String password, String name) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Mengupdate data pengguna setelah berhasil mendaftar
      User? user = userCredential.user;
      if (user != null) {
        await user.updateDisplayName(name);

        userEmail.value = user.email ?? '';
        userName.value = user.displayName ?? '';
        userPhotoUrl.value = user.photoURL ?? '';

        // Menyimpan data pengguna ke Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': email,
          'name': name,
          'photoUrl': 'assets/default_profile_photo.png' // Foto profil default
        });

        // Mengatur foto profil default
        userPhotoUrl.value = 'assets/default_profile_photo.png';
      }
      Get.snackbar('Success', 'Your Account Has Created, Please Login',
          snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
      Get.offAllNamed(AppRoutes.login);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Register Failed', 'The password provided is too weak',
            snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Register Failed', 'Your Email Already Use',
            snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
      }
    } catch (e) {
      print(e);
    }
  }

  void updateProfile(
      String name, String password, String email, String photoUrl) async {
    try {
      User? user = auth.currentUser;

      if (user != null) {
        // Update nama pengguna
        if (name.isNotEmpty) {
          await user.updateDisplayName(name);
          userName.value = name;
        }

        // Update kata sandi
        if (password.isNotEmpty) {
          await user.updatePassword(password);
        }

        // Update email
        if (email.isNotEmpty) {
          await user.updateEmail(email);
          userEmail.value = email;
        }

        if (photoUrl.isNotEmpty) {
          await user.updatePhotoURL(photoUrl);
          userPhotoUrl.value = photoUrl;
          print(userPhotoUrl.value);

          // Update data pengguna di Firestore
          await firestore.collection('users').doc(user.uid).update({
            'name': name,
            'email': email,
            'photoUrl': photoUrl,
          });
        }
        userPhotoUrl.value = photoUrl;
        preferences?.setString('photoUrl', user.photoURL ?? '');
        Get.snackbar('Success', 'Profile updated successfully',
            snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
        Get.offAllNamed(AppRoutes.navbar);
        print(userPhotoUrl.value);
        print(photoUrl);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile',
          snackPosition: SnackPosition.TOP, duration: Duration(seconds: 3));
    }
  }

  void getUserPhotoUrl() async {
    try {
      // Mengambil dokumen pengguna dari Firestore berdasarkan ID pengguna
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await firestore.collection('users').doc(auth.currentUser?.uid).get();

      // Mendapatkan URL foto profil dari dokumen pengguna
      String photoUrl = snapshot.data()?['photoUrl'] ?? '';

      // Perbarui nilai userPhotoUrl jika photoUrl tidak kosong
      if (photoUrl.isNotEmpty) {
        userPhotoUrl.value = photoUrl;

        preferences?.setString('photoUrl', photoUrl);
      }
    } catch (e) {
      print('Error getting user photo URL: $e');
    }
  }

  void chechAuthStatus() async {
    String? userEmail = preferences?.getString('email');
    String? userName = preferences?.getString('nama');
    String? userPhotoUrl = preferences?.getString('photoUrl');

    if (userEmail != null && userName != null && userPhotoUrl != null) {
      this.userEmail.value = userEmail;
      this.userName.value = userName;
      this.userPhotoUrl.value = userPhotoUrl;

      Get.offAllNamed(AppRoutes.navbar);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
