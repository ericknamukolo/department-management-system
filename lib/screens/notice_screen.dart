import 'package:bot_toast/bot_toast.dart';
import 'package:department_management/constants/text_constants.dart';
import 'package:department_management/providers/notifications.dart';
import 'package:department_management/widgets/notice_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoticeScreen extends StatefulWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  State<NoticeScreen> createState() => _NoticeScreenState();
}

class _NoticeScreenState extends State<NoticeScreen> {
  bool _isLoading = false;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noticeController = TextEditingController();
  @override
  void initState() {
    Future.delayed(Duration.zero).then(
      (_) async {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<Notifications>(context, listen: false)
            .fetchAndSetNotifications();
        setState(() {
          _isLoading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newNotifications =
        Provider.of<Notifications>(context).newNotifications;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Notices',
                  style: kTitleTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Title',
                    border: InputBorder.none,
                    labelStyle: kBodyTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: noticeController,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: 'Start typing in your notice...',
                    border: InputBorder.none,
                    labelStyle: kBodyTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kSecondaryColor,
                  ),
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    await Provider.of<Notifications>(context, listen: false)
                        .sendNotice(
                      titleController.text,
                      noticeController.text,
                    );
                    titleController.clear();
                    noticeController.clear();
                    await Provider.of<Notifications>(context, listen: false)
                        .fetchAndSetNotifications();
                    setState(() {
                      _isLoading = false;
                    });
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text('Send Notice'),
                  ),
                ),
              ],
            ),
          ),
        ),
        const VerticalDivider(
          color: Color(0xff8692A1),
          endIndent: 40,
          indent: 40,
        ),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'All Notifications (${newNotifications.length.toString()})',
                    style: kTitleTextStyle,
                  ),
                  _isLoading
                      ? const Padding(
                          padding: EdgeInsets.only(top: 200),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: kPrimaryColor,
                            ),
                          ),
                        )
                      : ListView.builder(
                          reverse: true,
                          itemBuilder: (context, index) => NoticeCard(
                            title: newNotifications[index].title,
                            semester: 'Sem X',
                            message: newNotifications[index].message,
                          ),
                          shrinkWrap: true,
                          itemCount: newNotifications.length,
                          physics: const NeverScrollableScrollPhysics(),
                        ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
