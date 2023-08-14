part of '../home_page.dart';

class WheaterWidget extends StatelessWidget {
  const WheaterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/sunny.svg',
            height: 150,
            width: 150,
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Positioned(
                    right: -2,
                    top: -2,
                    child: Text(
                      '° C',
                      style: $style.text.bodyBold,
                    ),
                  ),
                  Text(
                    '19',
                    style: $style.text.header1,
                  ),
                ],
              ),
              Text(
                'Rainy',
                style: $style.text.title2,
              )
            ],
          )
        ],
      ),
    );
  }
}
