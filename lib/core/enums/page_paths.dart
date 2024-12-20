enum PagePaths {
  splash(
    path: "/",
    name: "/",
  ),
  main(
    path: "/main",
    name: "/main",
  ),
  home(
    path: "/home",
    name: "home",
  ),
  settings(
    path: "/settings",
    name: "settings",
  ),
  disconnect(
    path: "/disconnect",
    name: "disconnect",
  ),
  countryDetail(
    path: "/countryDetail",
    name: "/countryDetail",
  ),
  ;

  final String path;
  final String name;

  const PagePaths({
    required this.path,
    required this.name,
  });
}
