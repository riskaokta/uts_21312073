import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMahasiswaController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNPM;
  late TextEditingController cAlamat;
  late TextEditingController cProgram_Studi;
  late TextEditingController cJk;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void AddMahasiswa(String nama, String npm, String alamat,
      String program_studi, String jk) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");

    try {
      await mahasiswa.add({
        "npm": npm,
        "name": nama,
        "address": alamat,
        "study": program_studi,
        "gender": jk,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data produk",
          onConfirm: () {
            cNPM.clear();
            cNama.clear();
            cAlamat.clear();
            cProgram_Studi.clear();
            cJk.clear();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {}
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNPM = TextEditingController();
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    cProgram_Studi = TextEditingController();
    cJk = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNPM.dispose();
    cNama.dispose();
    cAlamat.dispose();
    cProgram_Studi.dispose();
    cJk.dispose();
    super.onClose();
  }
}
