enum Flavor {
  DEVELOPMENT,
}

class FlavorConfig {
  static Flavor? appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.DEVELOPMENT:
        return 'Development';
      default:
        return 'Agachaditos';
    }
  }

}
