enum SvgPaths {
  power(path: "assets/svgs/ic_power.svg"),
  rightArrow(path: "assets/svgs/ic_arrow-right.svg"),
  download(path: "assets/svgs/ic_download.svg"),
  upload(path: "assets/svgs/ic_upload.svg"),
  infoCircle(path: "assets/svgs/ic_info-circle.svg"),
  appbarBackgroun(path: "assets/svgs/appbar_background.png"),
  crown(path: "assets/svgs/ic_crown.svg"),
  category(path: "assets/svgs/ic_category.svg"),
  search(path: "assets/svgs/ic_search.svg"),
  radar(path: "assets/svgs/ic_radar.svg"),
  map(path: "assets/svgs/ic_map.svg"),
  setting(path: "assets/svgs/ic_setting.svg"),
  ;

  final String path;

  const SvgPaths({required this.path});
}
