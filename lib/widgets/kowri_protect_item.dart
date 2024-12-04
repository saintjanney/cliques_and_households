import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class KowriProtectItem extends StatelessWidget {
  const KowriProtectItem({
    super.key,
    required this.insuranceData,
    required this.context,
  });

  final dynamic insuranceData;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => insuranceData['onTap'](context),
        child: ListTile(
            contentPadding: const EdgeInsets.only(left: 10),
            leading: SvgPicture.asset(
              insuranceData['image'],
              height: 50,
              width: 50,
              placeholderBuilder: (BuildContext context) => Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(66, 139, 195, 74),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            title: Text(insuranceData['name'],
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall),
            subtitle: insuranceData['description'].isNotEmpty
                ? Text(
                    insuranceData['description'],
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF8F92A1),
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )
                : null,
            trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios,
                    size: 14, color: Color(0xFFAFAFAF)))));
  }
}
