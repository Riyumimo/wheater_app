part of '../home_page.dart';

class WheaterTimeItem extends StatelessWidget {
  const WheaterTimeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        height: 68.h,
        width: 46.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('13:00', style: $style.text.bodySmallBold),
            SvgPicture.asset(
              'assets/images/sunny.svg',
              width: 24.w,
              height: 24.h,
            ),
            Text(
              '21 °',
              style: $style.text.bodySmallBold,
            ),
          ],
        ),
      ),
    );
  }
}
