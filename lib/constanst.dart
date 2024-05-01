// ignore: constant_identifier_names
// ignore_for_file: constant_identifier_names, duplicate_ignore

enum PetType { DOG, CAT, HAMSTER, FISH, TURTLE, RABBIT, BIRTH, SQUIRREL }

extension PetTypeExtension on PetType {
  int get value {
    switch (this) {
      case PetType.DOG:
        return 0;
      case PetType.CAT:
        return 1;
      case PetType.HAMSTER:
        return 2;
      case PetType.FISH:
        return 3;
      case PetType.TURTLE:
        return 4;
      case PetType.RABBIT:
        return 5;
      case PetType.BIRTH:
        return 6;
      case PetType.SQUIRREL:
        return 7;
      default:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case PetType.DOG:
        return 'Chó';
      case PetType.CAT:
        return 'Mèo';
      case PetType.HAMSTER:
        return 'Chuột Hamster';
      case PetType.FISH:
        return 'Cá';
      case PetType.TURTLE:
        return 'Rùa';
      case PetType.RABBIT:
        return 'Thỏ';
      case PetType.BIRTH:
        return 'Chim';
      case PetType.SQUIRREL:
        return 'Sóc';
      default:
        return '';
    }
  }
}

const BASE_URL_IMAGE =
    'https://lanha-bucket-dev.s3.ap-southeast-1.amazonaws.com/petsocials/uploads';
