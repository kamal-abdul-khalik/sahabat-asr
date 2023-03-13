import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class AddMemberView extends StatefulWidget {
  const AddMemberView({Key? key}) : super(key: key);

  Widget build(context, AddMemberController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Member Baru"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: controller.uploadFormKey,
              child: Column(
                children: [
                  QImagePicker(
                    label: "Foto KTP",
                    hint: "Foto KTP",
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.imageKtp = value;
                    },
                  ),
                  const SizedBox(height: 10.0),
                  QImagePicker(
                    label: "Foto Selfie",
                    hint: "Foto Selfie",
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.imageSelfie = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  QTextField(
                    label: "Nama Lengkap",
                    maxLength: 20,
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.name = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  QTextField(
                    label: "Email",
                    validator: Validator.email,
                    suffixIcon: Icons.email,
                    onChanged: (value) {
                      controller.email = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  QNumberField(
                    label: "Nomor KTP",
                    maxLength: 16,
                    validator: Validator.ktpNumber,
                    onChanged: (value) {
                      controller.ktpNumber = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  if (controller.cityList.isNotEmpty)
                    QDropdownField(
                      label: "Kota",
                      validator: Validator.required,
                      items: controller.cityList,
                      onChanged: (value, label) async {
                        controller.cityCode = value;
                        if (controller.cityCode !=
                            await controller.getDistrict(value)) {
                          controller.districtList = [];
                        }
                        await controller.getDistrict(value);
                      },
                    ),
                  // const SizedBox(height: 10.0),
                  if (controller.districtList.isNotEmpty)
                    QDropdownField(
                      label: "Kecamatan",
                      hint: 'Pilih Kecamatan Asal',
                      validator: Validator.required,
                      items: controller.districtList,
                      onChanged: (value, label) async {
                        controller.districtCode = value;
                        if (controller.districtCode !=
                            await controller.getVillage(value)) {
                          controller.villageList = [];
                        }
                        await controller.getVillage(value);
                      },
                    ),
                  const SizedBox(height: 20.0),
                  if (controller.villageList.isNotEmpty &&
                      controller.districtList.isNotEmpty)
                    QDropdownField(
                      label: "Kelurahan",
                      hint: 'Pilih Kelurahan Asal',
                      validator: Validator.required,
                      items: controller.villageList,
                      onChanged: (value, label) async {
                        controller.villageCode = value;
                      },
                    ),
                  const SizedBox(height: 20.0),
                  QNumberField(
                    label: "No. HP/WA",
                    maxLength: 12,
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.phone = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  QTextField(
                    label: "Tempat Lahir",
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.birthPlace = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  QDatePicker(
                    label: "Tanggal Lahir",
                    validator: Validator.required,
                    onChanged: (value) {
                      DateTime date = value;
                      controller.birtDate =
                          DateFormat("yyyy-MM-dd").format(date);
                    },
                  ),
                  const SizedBox(height: 20.0),
                  QTextField(
                    label: "Alamat",
                    validator: Validator.required,
                    onChanged: (value) {
                      controller.address = value;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  QRadioField(
                    label: "Jenis Kelamin",
                    validator: Validator.atLeastOneitem,
                    items: const [
                      {
                        "label": "Laki-Laki",
                        "value": 1,
                      },
                      {
                        "label": "Perempuan",
                        "value": 2,
                      }
                    ],
                    onChanged: (value, label) {
                      controller.gender = label!;
                    },
                  ),
                  if (controller.religionList.isNotEmpty)
                    QDropdownField(
                      label: "Agama",
                      validator: Validator.required,
                      items: controller.religionList,
                      onChanged: (value, label) {
                        controller.religionId = value;
                      },
                    ),
                  const SizedBox(height: 20.0),
                  if (controller.ethnicList.isNotEmpty)
                    QDropdownField(
                      label: "Suku",
                      validator: Validator.required,
                      items: controller.ethnicList,
                      onChanged: (value, label) {
                        controller.ethnicId = value;
                      },
                    ),
                  const SizedBox(height: 50.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(360, 60),
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () => controller.doUpload(),
                    child: const Text(
                      "UPLOAD",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<AddMemberView> createState() => AddMemberController();
}
