import 'package:flutter/material.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    super.key,
  });

  // String _getInitials() {

  //   return '${firstName.isNotEmpty ? firstName[0] : ''}${lastName.isNotEmpty ? lastName[0] : ''}';
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 170,
      width: double.infinity,
      color: Colors.green,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 54),
      child: SizedBox(
        width: 353,
        child: Row(
          children: [
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              child: Text(
                'WT',
                style: TextStyle(
                  color: Color.fromRGBO(107, 120, 142, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              'Hello, Winning Team',
              // l10n.greeting(user.result?.userProfile?.firstName ?? ''),
              style: TextStyle(
                  color: Colors.white, fontFamily: "SF Pro Text"),
            ),
            const Spacer(),
            InkWell(
              onTap: () async {
                // final String url =
                //     await Helper.buildLiveChatUrl(user: user, errorMessage: "");
                // Helper.openUrl(url);
              },
              child: const Icon(Icons.support_agent_outlined,
                  color: Colors.white, size: 24),
            ),
            const SizedBox(width: 14),
            const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 14),
            InkWell(
              onTap: () {},
              // context.push(GoRouterConfig.settingsRoute, extra: user),
              child: const Icon(
                Icons.settings_outlined,
                size: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
