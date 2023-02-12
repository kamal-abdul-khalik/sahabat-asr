import 'package:flutter/material.dart';
import 'package:kta_asr/core.dart';

class LeaderController extends State<LeaderView> implements MvcController {
  static late LeaderController instance;
  late LeaderView view;

  @override
  void initState() {
    instance = this;
    getMemberList();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List memberList = [];
  getMemberList() async {
    try {
      Map obj = await LeaderService.getMember();
      memberList = obj['data'];
      memberList.isNotEmpty
          ? memberList
          : showInfoDialog('Anda belum memiliki member');
      setState(() {});
    } catch (e) {
      showInfoDialog(e.toString());
    }
  }

  deleteMember(int id) async {
    Map obj = await LeaderService.deleteMember(id: id);
    snackbarIconSoftSuccess(message: 'member berhasil dihapus');
    getMemberList();
  }

  getSingleMember(int id) async {
    Map obj = await LeaderService.getSingleMember(id: id);
    Get.to(const ProfileMemberView());
  }
}
