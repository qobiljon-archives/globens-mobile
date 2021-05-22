
class CountryHelper {
  static Map<String, String> countries = {"AUS": "Australia", "CAN": "Canada", "CHN": "China", "DEU": "Germany", "ITA": "Italy", "JPN": "Japan", "KAZ": "Kazakhtan", "KOR": "South Korea", "MYS": "Malaysia", "RUS": "Russia", "TUR": "Turkey", "USA": "United States", "UZB": "Uzbekistan"};

  static String countryName(String countryCode) {
    if (countries.containsKey(countryCode)) return countries[countryCode];
    return "KOR";
  }
}
