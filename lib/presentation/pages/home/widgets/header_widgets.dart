part of '../home_page.dart';

class HeadedWheaterWidget extends StatelessWidget {
  const HeadedWheaterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stockholm, \nSweden',
              style: $style.text.title1,
              maxLines: 2,
            ),
            const Gap(6),
            Text(
              'Tue, Jun 30',
              style: $style.text.bodyBold,
            ),
          ],
        ),
      ),
    );
  }
}
