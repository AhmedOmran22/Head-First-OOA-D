enum Builder {
  fender,
  martin,
  gibson,
  prs,
  yamaha,
  ianez;

  String toString() {
    switch (this) {
      case Builder.fender:
        return 'Fender';
      case Builder.martin:
        return 'Martin';
      case Builder.gibson:
        return 'Gibson';
      case Builder.prs:
        return 'PRS';
      case Builder.yamaha:
        return 'Yamaha';
      case Builder.ianez:
        return 'Ibanez';
    }
  }
}
