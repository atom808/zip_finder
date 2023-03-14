extension StringUtil on String{
  String get cleanStringAndSpaces {
    return this.replaceAll(new RegExp(r'[^\w\s]+'), '').replaceAll(' ', '');
  }
}
