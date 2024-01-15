generateExceptionMessage(exceptionCode) {
  String errorMessage;

  switch (exceptionCode) {
    case "Exception: invalid_email":
      errorMessage = 'Your email address appears to be malformed.';
      break;
    case "Exception: wrong_password":
      errorMessage = 'Your password is wrong.';
      break;
    case "Exception: user_not_found":
      errorMessage = 'User with this email doesn\'t exist.';
      break;
    case "Exception: error_user_disabled":
      errorMessage = 'User with this email has been disabled.';
      break;
    case "Exception: too_many_requests":
      errorMessage = 'Too many requests. Try again later.';
      break;
    case "Exception: operation_not_allowed":
      errorMessage = 'Signing in with Email and Password is not enabled.';
      break;
    case "Exception: email_already_in_use":
      errorMessage = 'The email has already been registered.';
      break;
    default:
      errorMessage = 'An undefined Error happened.';
  }

  return errorMessage;
}
