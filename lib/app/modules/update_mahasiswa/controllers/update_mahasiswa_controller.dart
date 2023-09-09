import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateMahasiswaController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNPM;
  late TextEditingController cAlamat;
  late TextEditingController cProgram_Studi;
  late TextEditingController cJk;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection('mahasiswa').doc(id);

    return docRef.get();
  }

  void updateMahasiswa(String npm, String nama, String alamat,
      String program_studi, String jk, String id) async {
    DocumentReference mahasiswaById = firestore.collection("mahasiswa").doc(id);
    try {
      await mahasiswaById.update({
        "npm": npm,
        "name": nama,
        "address": alamat,
        "study": program_studi,
        "gender": jk,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengubah Data Mahasiswa.",
        onConfirm: () {
          cNPM.clear();
          cNama.clear();
          cAlamat.clear();
          cProgram_Studi.clear();
          cJk.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Mahasiswa.",
      );
    }
  }

  @override
  void onInit() {
    cNPM = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    cProgram_Studi = TextEditingController();
    cJk = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    cNPM.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cProgram_Studi.dispose();
    cJk.dispose();
    super.onClose();
  }
}
