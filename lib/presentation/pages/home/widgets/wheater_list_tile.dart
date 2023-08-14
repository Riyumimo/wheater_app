part of '../home_page.dart';

class WheaterListTile extends StatelessWidget {
  const WheaterListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
      child: Container(
        padding:
            const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 11),
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0x5CFFFFFF)),
        child: SeparatedRow(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          separatorBuilder: () => Gap(8.w),
          children: <Widget>[
            Card(
              color: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: SvgPicture.asset(
                'assets/images/rain.svg',
                height: 32,
                width: 32,
              ),
            ),
            Text(
              'Rainfall',
              style: $style.text.bodySmallBold,
            ),
            const Spacer(),
            Text(
              '3cm',
              style: $style.text.bodySmallBold,
            )
          ],
        ),
      ),
    );
  }
}
