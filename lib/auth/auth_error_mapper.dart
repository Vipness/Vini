class AuthErrorMapper {
  static String toSlovenian(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Napačen email ali geslo.'; // to not expose too much information
      case 'wrong-password':
        return 'Napačen email ali geslo.';
      case 'invalid-credential':
        return 'Neveljaven email ali geslo.';
      case 'invalid-email':
        return 'Neveljaven email naslov.';
      case 'email-already-in-use':
        return 'Ta email naslov je že v uporabi.';
      case 'weak-password':
        return 'Geslo je prešibko (vsaj 6 znakov).';
      case 'too-many-requests':
        return 'Preveč poskusov. Poskusite kasneje.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Neveljavne poverelnice za prijavo.';
      case 'channel-error':
        return 'Vpišite svoje poverilnice in poskusite znova.';
      default:
        return 'Prišlo je do napake. Poskusite znova.';
    }
  }
}
