enum GuitarType {
  electric,
  acoustic;

  String toString() {
    switch (this) {
      case GuitarType.electric:
        return 'Electric';
      case GuitarType.acoustic:
        return 'Acoustic';
    }
  }
}