validatingName(String name) {
  if (name.trim().isEmpty) {
    return "Name field Is Empty!";
  } else if (name.split(" ").length < 2) {
    return "Name must more than 2 word!";
  } else if (isStringOnlyLetters(name) == false) {
    return "Name must only contain letters!";
  } else if (name.trim().split('')[0] !=
      name.trim().split('')[0].toUpperCase()) {
    return "Name must start with Uppercase!";
  }
  return null;
}

bool isStringOnlyLetters(String str) {
  return str.trim().isNotEmpty &&
      str
          .split(' ')
          .join()
          .split('')
          .every((char) => RegExp(r'^[a-zA-Z]+$').hasMatch(char));
}

validatingNumber(String nmbr) {
  final number = nmbr.split(' ').join().split('').join();

  if (number.length < 8 || number.length > 15) {
    return "Phone number length must minimum is 8 and maximum is 15!";
  } else if (!isStringOnlyNumeric(nmbr)) {
    return "Phone number must only contain number!";
  } else if (!number.startsWith('0')) {
    return "Phone number must start with 0!";
  }
  return null;
}

bool isStringOnlyNumeric(String str) {
  return str.trim().isNotEmpty &&
      str
          .split(' ')
          .join()
          .split('')
          .every((char) => int.tryParse(char) != null);
}