part of '../home_page.dart';

class WheaterTimeItem extends StatefulWidget {
  const WheaterTimeItem({
    super.key,
    required this.selected,
    required this.onChange,
    this.timeLine,
    this.temperature = 32,
    this.imgAsset = 'sunny.svg',
  });
  final bool selected;
  final Function(bool data) onChange;
  final DateTime? timeLine;
  final int? temperature;
  final String? imgAsset;

  @override
  State<WheaterTimeItem> createState() => _WheaterTimeItemState();
}

class _WheaterTimeItemState extends State<WheaterTimeItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChange(widget.selected);
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Container(
          height: 68.h,
          width: 46.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.selected
                  ? Colors.white
                  : Colors.white.withOpacity(.3)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('13:00', style: $style.text.bodySmallBold),
              SvgPicture.asset(
                'assets/images/${widget.imgAsset}',
                width: 24.w,
                height: 24.h,
              ),
              Text(
                '${widget.temperature}°',
                style: $style.text.bodySmallBold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
