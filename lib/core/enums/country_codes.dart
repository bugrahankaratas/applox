enum CountriesInfo {
  no(code: '-', name: '-'),

  tr(code: 'tr', name: 'Turkey'),
  us(code: 'us', name: 'United States'),
  en(code: 'gb', name: 'England'),
  de(code: 'de', name: 'Germany'),
  fr(code: 'fr', name: 'France'),
  es(code: 'es', name: 'Spain'),
  it(code: 'it', name: 'Italy'),
  ru(code: 'ru', name: 'Russia'),
  ;

  final String code;
  final String name;

  const CountriesInfo({required this.code, required this.name});
}
