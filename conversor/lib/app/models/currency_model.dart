class CurrencyModel {
  final String name;
  final double real;
  final double dolar;
  final double euro;
  final double bitcoin;

  CurrencyModel(
      {required this.name,
      required this.real,
      required this.dolar,
      required this.euro,
      required this.bitcoin});

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel>[
      CurrencyModel(
          name: 'Real',
          real: 1.0,
          dolar: 0.19,
          euro: 0.19,
          bitcoin: 0.000009666320172329159),
      CurrencyModel(
          name: 'Dolar',
          real: 5.30,
          dolar: 1.0,
          euro: 1,
          bitcoin: 0.000051371318827599995),
      CurrencyModel(
          name: 'Euro',
          real: 5.30,
          dolar: 1,
          euro: 1,
          bitcoin: 0.000051371318827599995),
      CurrencyModel(
          name: 'Bitcoin',
          real: 103455.20,
          dolar: 19466.12,
          euro: 19466.12,
          bitcoin: 1)
    ];
  }
}
