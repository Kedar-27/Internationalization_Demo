enum Flavor {
  FREE,
  PRO,
}

class F {
  static Flavor appFlavor;

  static String get title {
    switch (appFlavor) {
      case Flavor.FREE:
        return 'Free App';
      case Flavor.PRO:
        return 'Pro App';
      default:
        return 'title';
    }
  }

}
