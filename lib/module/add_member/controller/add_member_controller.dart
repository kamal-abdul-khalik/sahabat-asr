import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';
import 'package:kta_asr/service/member_service.dart';

class AddMemberController extends State<AddMemberView>
    implements MvcController {
  static late AddMemberController instance;
  late AddMemberView view;

  @override
  void initState() {
    instance = this;
    getCity();
    getEthnic();
    getReligion();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
  final uploadFormKey = GlobalKey<FormState>();
  bool isVisible = false;

  String name = '';
  String email = '';
  String ktpNumber = '';
  String cityCode = '';
  String districtCode = '';
  String villageCode = '';
  String phone = '';
  String birthPlace = '';
  String birtDate = '';
  String address = '';
  String gender = '';
  int religionId = 0;
  int ethnicId = 0;
  String imageKtp = '';
  String imageSelfie = '';

  doUpload() async {
    bool isValidate = uploadFormKey.currentState!.validate();
    if (isValidate) {
      showLoading();
      try {
        Map obj = await MemberService.uploadDataMember(
          name: name,
          email: email,
          ktpNumber: ktpNumber,
          cityCode: cityCode,
          districtCode: districtCode,
          villageCode: villageCode,
          phone: phone,
          birthPlace: birthPlace,
          birtDate: birtDate,
          address: address,
          gender: gender,
          religionId: religionId,
          ethnicId: ethnicId,
          imageKtp: imageKtp,
          imageSelfie: imageSelfie,
        );

        if (obj['status'] == false) {
          hideLoading();
          snackbarIconSoftDanger(message: obj['message']);
          return;
        }
        hideLoading();
        snackbarIconSoftSuccess(message: 'Data berhasil diupload');
        Get.to(const LeaderView());
        return;
      } catch (e) {
        hideLoading();
        showInfoDialog(e.toString());
      }
    }
  }

  List<Map<String, dynamic>> ethnicList = [];
  getEthnic() async {
    Map obj = await DropdownService.getEthnics();
    var tempEthnicList = obj['data'];
    for (var ethnic in tempEthnicList) {
      ethnicList.add({
        "label": ethnic['name'],
        "value": ethnic['id'],
      });
    }
    setState(() {});
  }

  List<Map<String, dynamic>> religionList = [];
  getReligion() async {
    Map obj = await DropdownService.getReligions();
    var tempReligionList = obj['data'];
    for (var religion in tempReligionList) {
      religionList.add({
        "label": religion['name'],
        "value": religion['id'],
      });
    }
    setState(() {});
  }

  List<Map<String, dynamic>> cityList = [];
  getCity() async {
    Map obj = await DropdownService.getCities();
    var tempCityList = obj['data'];
    for (var city in tempCityList) {
      cityList.add({
        "label": city['name'],
        "value": city['code'],
      });
    }
    setState(() {});
  }

  List<Map<String, dynamic>> districtList = [];
  getDistrict(code) async {
    Map obj = await DropdownService.getDistricts(code);
    var tempDistrictList = obj['data'];
    for (var district in tempDistrictList) {
      districtList.add({
        "label": district['name'],
        "value": district['code'],
      });
    }
    setState(() {});
  }

  List<Map<String, dynamic>> villageList = [];
  getVillage(code) async {
    Map obj = await DropdownService.getVillages(code);
    var tempVillageList = obj['data'];
    for (var village in tempVillageList) {
      villageList.add({
        "label": village['name'],
        "value": village['code'],
      });
    }
    setState(() {});
  }

  printInput() {
    print("name : $name");
    print("email : $email");
    print("ktpNumber : $ktpNumber");
    print("cityCode : $cityCode");
    print("districtCode : $districtCode");
    print("villageCode : $villageCode");
    print("phone : $phone");
    print("birthPlace : $birthPlace");
    print("birtDate : $birtDate");
    print("address : $address");
    print("gender : $gender");
    print("religionId : $religionId");
    print("ethnicId : $ethnicId");
    print("imageKtp : $imageKtp");
    print("imageSelfie : $imageSelfie");
  }
}
